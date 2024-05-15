/// <summary>
/// Table MyTable (ID 50100).
/// </summary>
table 50149 "Restaurant Table"
{
    DataClassification = CustomerContent;
    Caption = 'Restaurant Table';
    LookupPageId = "Restaurant Tables";
    DrillDownPageId = "Restaurant Tables";

    fields
    {
        field(1; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
        }
        field(2; Code; Code[20])
        {
            Caption = 'Code';
        }
    }

    keys
    {
        key(PK; Code, "Rest. No.")
        {
            Clustered = true;
        }
    }
}