/// <summary>
/// OnInsert.
/// </summary>
table 50104 "Restaurant Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Restaurant Setup';
    LookupPageId = "Restaurant Setup";
    DrillDownPageId = "Restaurant Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; "Restaurant Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Restaurant Nos.';
            TableRelation = "No. Series".Code;
        }
        field(3; "Restaurant Order Nos."; Code[20])
        {
            Caption = 'Restaurant Order Nos.';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}