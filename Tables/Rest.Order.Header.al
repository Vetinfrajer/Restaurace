/// <summary>
/// OnInsert.
/// </summary>
table 50102 "Rest. Order Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Rest. Order";
    DrillDownPageId = "Rest. Order";
    Caption = 'Restaurant Order Header';


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                NoSeries: Record Restaurant;
            begin
                if NoSeries.Get("No.") then
                    "No. Series" := NoSeries."No. Series"
                else
                    "No. Series" := '';
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                CustomerRec: Record Customer;
            begin
                if CustomerRec.Get("Customer No.") then
                    "Customer Name" := CustomerRec.Name
                else
                    "Customer Name" := '';
            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            Editable = false;
        }
        field(4; "Rest. Table Code"; Code[20])
        {
            Caption = 'Rest. Table Code';
            TableRelation = "Restaurant Table"."Code" WHERE("Rest. No." = FIELD("Rest. No."));
            trigger OnValidate()
            var
                RestOrderLine: Record "Rest. Order Line";
            begin
                if Rec."Rest. Table Code" <> xRec."Rest. Table Code" then begin
                    RestOrderLine.SetRange("Rest. Order No.", "No.");
                    RestOrderLine.ModifyAll("Rest. Table Code", Rec."Rest. Table Code");
                    /*
                    toto řešení je pro více proměných
                if RestOrderLine.FindSet(true) then begin
                    repeat
                        RestOrderLine."Rest. Table Code" := Rec."Rest. Table Code";
                        RestOrderLine.Modify();
                    until RestOrderLine.Next() = 0;
                end;*/
                end;


            end;
        }
        field(5; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
            TableRelation = "Restaurant"."No.";
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(7; "Amount"; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Rest. Order Line"."Line Amount" where
                ("Rest. Order No." = field("No."))
            );
        }
        field(8; "Line Count"; Integer)
        {
            Caption = 'Line Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Rest. Order Line" where
                ("Rest. Order No." = field("No."))
            );
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
