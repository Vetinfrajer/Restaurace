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
                OrderSubpage: Page "Restaurant Order Subpage";
            begin
                OrderSubpage.SetOrderCodeFilter(Rec."No.");
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer"."No.";
        }
        field(3; "Rest. Table Code"; Code[20])
        {
            Caption = 'Rest. Table Code';
            TableRelation = "Restaurant Table"."Code" WHERE("Rest. No." = FIELD("Rest. No."));
        }
        field(4; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
            TableRelation = "Restaurant"."No.";
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(6; "Amount"; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Rest. Order Line"."Line Amount" where
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