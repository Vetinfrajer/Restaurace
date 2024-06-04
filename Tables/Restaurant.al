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
            TableRelation = "No. Series".Code;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Rest. Order Line"."Total Amount" where
                ("Rest. No." = field("No."))
            );
        }
        field(5; Count; Integer)
        {
            Caption = 'Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Rest. Order header" where
                ("Rest. No." = field("No."))
            );
        }
        field(6; "Table Code"; Code[20])
        {
            Caption = 'Table Code';
            TableRelation = "Restaurant Table"."Code"
                WHERE("Rest. No." = FIELD("No.")
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

    /// <summary>
    /// TestNoSeries.
    /// </summary>
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

        if Rec."No." <> xRec."No." then begin
            RestaurantSetup.Get();
            NoSeriesMgt.TestManual(RestaurantSetup."Restaurant Nos.");
            Rec."No. Series" := '';
        end;
    end;

    // Lokální procedura pro událost před testem číselné řady
    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var Restaurant: Record Restaurant; xRestaurant: Record Restaurant; var IsHandled: Boolean)
    begin
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldRestaurant">Record Restaurant.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldRestaurant: Record Restaurant): Boolean
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RestaurantSetup: Record "Restaurant Setup";

    begin
        RestaurantSetup.Get();
        RestaurantSetup.TestField("Restaurant Nos.");
        if NoSeriesMgt.SelectSeries(RestaurantSetup."Restaurant Nos.", OldRestaurant."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;


    trigger OnInsert()

    var
        IsHandled: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RestaurantSetup: Record "Restaurant Setup";
    begin

        if "No." = '' then begin
            RestaurantSetup.Get();
            RestaurantSetup.TestField("Restaurant Nos.");
            NoSeriesMgt.InitSeries(RestaurantSetup."Restaurant Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

}