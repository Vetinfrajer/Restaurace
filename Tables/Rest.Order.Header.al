/// <summary>
/// OnInsert.
/// </summary>
table 50102 "Rest. Order Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Rest. Order";
    DrillDownPageId = "Rest. Order";
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
            TableRelation = "Restaurant"."No.";
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        myInt: Integer;
    begin

    end;

    /// <summary>
    /// GenerovatCislo.
    /// </summary>
    /// <returns>Return value of type Code[20].</returns>
    procedure GenerovatCislo(): Code[20]
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewNumber: Code[20];
    begin
        NewNumber := NoSeriesMgt.GetNextNo('MYNOSERIES', 0D, true);
        exit(NewNumber);
    end;
}