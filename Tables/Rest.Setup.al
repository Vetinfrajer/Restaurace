/// <summary>
/// OnInsert.
/// </summary>
table 50104 "Rest. Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Restaurant Setup';
    LookupPageId = "Rest. Setup Page";
    DrillDownPageId = "Rest. Setup Page";
    
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

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}