/// <summary>
/// OnInsert.
/// </summary>
table 50102 "Rest. Order Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Restaurant Order";
    DrillDownPageId = "Restaurant Order";
    Caption = 'Restaurant Order Header';


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
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer"."No.";
            trigger OnValidate()
            var
                Customer: Record Customer;
                RestOrderLine: Record "Rest. Order Line";
            begin
                if "Customer No." <> xRec."Customer No." then begin
                    if Customer.Get("Customer No.") then
                        "Customer Name" := Customer.Name
                    else
                        Clear("Customer Name");

                    RestOrderLine.SetRange("Rest. Order No.", Rec."No.");
                    RestOrderLine.ModifyAll("Customer No.", Rec."Customer No.");
                end;
            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            Editable = false;
        }
        field(4; "Rest. Table Code"; Code[20])
        {
            Caption = 'Rest. Table Code';
            TableRelation = "Restaurant Table"."Code"
                WHERE("Rest. No." = FIELD("Rest. No.")
            );

            trigger OnValidate()
            var
                RestOrderLine: Record "Rest. Order Line";
            begin
                if Rec."Rest. Table Code" <> xRec."Rest. Table Code" then begin
                    RestOrderLine.SetRange("Rest. Order No.", "No.");
                    RestOrderLine.ModifyAll("Rest. Table Code", Rec."Rest. Table Code");
                    /*
                    toto řešení je pro více proměných
                if RestOrderLine.FindSet(true) then begin
                    repeat
                        RestOrderLine."Rest. Table Code" := Rec."Rest. Table Code";
                        RestOrderLine.Modify();
                    until RestOrderLine.Next() = 0;
                end;*/
                end;
            end;
        }
        field(5; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
            TableRelation = "Restaurant"."No.";
            trigger OnValidate()
            var
                Restaurant: Record Restaurant;
                RestOrderLine: Record "Rest. Order Line";
            begin
                if "Rest. No." <> xRec."Rest. No." then begin
                    if Restaurant.Get("Rest. No.") then
                        "Rest. Name" := Restaurant.Name
                    else
                        "Rest. name" := '';

                    RestOrderLine.SetRange("Rest. Order No.", "No.");
                    RestOrderLine.ModifyAll("Rest. No.", "Rest. No.");
                end;
            end;
        }
        field(6; "Rest. name"; Text[100])
        {
            Caption = 'Rest. name';
            Editable = false;
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(8; "Amount"; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Rest. Order Line"."Total Amount" where
                ("Rest. Order No." = field("No."))
            );
        }
        field(9; "Line Count"; Integer)
        {
            Caption = 'Line Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Rest. Order Line" where
                ("Rest. Order No." = field("No."))
            );
        }
        field(10; "Closed"; boolean)
        {
            Caption = 'Closed';
            Editable = false;

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
        RestOrderLine: Record "Rest. Order Line";
    begin
        CheckOpen();

        RestOrderLine.SetRange("Rest. Order No.", Rec."No.");
        RestOrderLine.DeleteAll(true);
    end;

    trigger OnModify()
    begin
        CheckOpen();
    end;

    local procedure TestNoSeries()
    var
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
            NoSeriesMgt.TestManual(RestaurantSetup."Restaurant Order Nos.");
            Rec."No. Series" := '';
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var Restaurant: Record "Rest. Order Header"; xRestaurant: Record "Rest. Order Header"; var IsHandled: Boolean)
    begin
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldHeader">Record "Rest. Order Header".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldHeader: Record "Rest. Order Header"): Boolean
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RestaurantSetup: Record "Restaurant Setup";
    begin
        RestaurantSetup.Get();
        RestaurantSetup.TestField("Restaurant Order Nos.");
        if NoSeriesMgt.SelectSeries(RestaurantSetup."Restaurant Order Nos.", OldHeader."No. Series", "No. Series")
        then begin
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
            RestaurantSetup.TestField("Restaurant Order Nos.");
            NoSeriesMgt.InitSeries(RestaurantSetup."Restaurant Order Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    /// <summary>
    /// Release.
    /// </summary>
    procedure Release()
    var
        OrderIsClosedTxt: Label 'Order is Closed';
    begin
        TestField("Customer No.");
        TestField("Rest. No.");
        TestField("Rest. Table Code");

        closed := true;
        modify();
        Message(OrderIsClosedTxt);
    end;
    /// <summary>
    /// ReOpen.
    /// </summary>
    procedure ReOpen()
    var
        OrderIsOpenTxt: Label 'Order is Re-opened';
    begin
        Closed := false;
        modify();
        Message(OrderIsOpenTxt);
    end;
    /// <summary>
    /// CheckOpen.
    /// </summary>
    procedure CheckOpen()
    begin
        Rec.TestField(Closed, false);
    end;
}

