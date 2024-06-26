/// <summary>
/// Table MyTable (ID 50100).
/// </summary>
table 50149 "Restaurant Table"
{
    DataClassification = CustomerContent;
    Caption = 'Restaurant Table';
    LookupPageId = "Restaurant tables";
    DrillDownPageId = "Restaurant tables";

    fields
    {
        field(1; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
            TableRelation = "Restaurant"."No.";
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; "Number Seats"; Integer)
        {
            Caption = 'Number of Seats';
        }
        field(4; "Name"; Text[50])
        {
            Caption = 'Name';
        }
        field(5; "Rest. Order Count"; Integer)
        {
            Caption = 'Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Rest. Order Header"
                where("Rest. Table Code" = field("Code"))
            );
        }
        field(6; "Rest. Order Amount"; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Rest. Order Line"."Total Amount"
                where("Rest. Table Code" = field("Code"),
                    "Item No." = field("Item Filter"))
            );
        }
        field(7; "Item Filter"; Code[20])
        {
            Caption = 'Item Filter';
            FieldClass = FlowFilter;
            TableRelation = "Rest. Order Line"."Item No." where
                ("Rest. Table Code" = field("Code"));
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
