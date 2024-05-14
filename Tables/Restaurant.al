/// <summary>
/// Table Restaurant (ID 50101).
/// </summary>
table 50101 Restaurant
{
    DataClassification = CustomerContent;
    Caption = 'Restaurant';
    LookupPageId = "Restaurant List";
    DrillDownPageId = "Restaurant List";

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

    trigger OnInsert()
    var
        RestaurantSetup: Record "Restaurant Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            RestaurantSetup.Get();
            RestaurantSetup.TestField("Restaurant Nos.");
            NoSeriesMgt.InitSeries(RestaurantSetup."Restaurant Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
    // dodělat číslování

    local procedure TestNoSeries()
    var
        Restaurant: Record Restaurant;
        IsHandled: Boolean;
        RestaurantSetup: Record "Restaurant Setup";
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

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldCust">Record Customer.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldCust: Record Restaurant): Boolean
    var
        RestaurantSetup: Record "Restaurant Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        RestaurantSetup.Get();
        RestaurantSetup.TestField("Restaurant Nos.");
        if NoSeriesMgt.SelectSeries(RestaurantSetup."Restaurant Nos.", OldCust."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var Restaurant: Record Restaurant; xRestaurant: Record Restaurant; var IsHandled: Boolean)
    begin
    end;

}