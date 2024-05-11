/// <summary>
/// OnInsert.
/// </summary>
table 50102 "Rest. Order Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Restaurant Order List";
    DrillDownPageId = "Restaurant Order List";
    Caption = 'Restaurant Order Hdr.';


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer"."No.";
        }
        field(3; "Rest. Table Code"; Code[20])
        {
            Caption = 'Rest. Table Code';
            TableRelation = "Restaurant Table"."Code";
        }
        field(4; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
        }
    }

    keys
    {
        key(PK; "Rest. Table Code")
        {
            Clustered = true;
        }
    }
}