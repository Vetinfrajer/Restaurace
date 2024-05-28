/// <summary>
/// TableExtension MyExtension (ID 50144) extends Record Customer.
/// </summary>
tableextension 50144 "Cu" extends Customer
{
    fields
    {
        field(1000; "Rest Order Count"; Integer)
        {
            Caption = 'Rest Order Count';
            FieldClass = FlowField;
            CalcFormula = count("Rest. Order Header" where
            ("Customer No." = field("No."))
            );
        }
        field(1001; "Rest Order Amount"; Decimal)
        {
            Caption = 'Rest Order Amount';
            //FieldClass = FlowField;
            // CalcFormula = sum("Rest. Order Line"."Total Amount" where
            //())
        }
    }

    keys
    {
    }
    /// <summary>
    /// GetCount.
    /// </summary>
    procedure UpdateCount()
    var
        Customer: Record Customer;
        RestaurantHeader: Record "Rest. Order Header";
    begin
        if RestaurantHeader.FindSet() then begin
            repeat
                if RestaurantHeader.Get(RestaurantHeader."Customer No.") then begin
                    Customer."Rest Order Count" := RestaurantHeader.Count;
                    Customer.Modify();
                end;
            until RestaurantHeader.Next() = 0;
        end;
    end;
}