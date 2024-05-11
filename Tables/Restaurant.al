/// <summary>
/// Table Restaurant (ID 50101).
/// </summary>
table 50101 Restaurant
{
    DataClassification = CustomerContent;
    Caption = 'Restaurant';

    LookupPageId = "Rest. Setup Page";
    DrillDownPageId = "Rest. Setup Page";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }

        field(2; "Name"; Text[50])
        {
            Caption = 'Name';
        }

        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
    }


    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var Restaurant: Record Restaurant; xRestaurant: Record Restaurant; var IsHandled: Boolean)
    begin
    end;

    local procedure TestNoSeries()
    var
        Restaurant: Record Restaurant;
        IsHandled: Boolean;
        RestaurantSetup: Record "Rest. Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IsHandled := false;
        OnBeforeTestNoSeries(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if Rec."No." <> xRec."No." then
            if not Restaurant.Get(Rec."No.") then begin
                RestaurantSetup.Get();
                NoSeriesMgt.TestManual(RestaurantSetup."Restaurant Nos.");
                Rec."No. Series" := '';
            end;
    end;




}