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
            DataClassification = CustomerContent;
            Caption = 'Rest. No.';
            TableRelation = "Restaurant"."No.";
        }
        field(2; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(3; "Number Seats"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Number of Seats';
        }
        field(4; Name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }


}