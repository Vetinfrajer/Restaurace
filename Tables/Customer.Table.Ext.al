/// <summary>
/// TableExtension MyExtension (ID 50144) extends Record Customer.
/// </summary>
tableextension 50144 "Customer" extends Customer
{
    Caption = 'Customer Table Extension';
    fields
    {
        field(1000; "Rest Order Count"; Integer)
        {
            Caption = 'Rest Order Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Rest. Order Header" where
            ("Customer No." = field("No."))
            );
        }
        field(1001; "Rest Order Amount"; Decimal)
        {
            Caption = 'Rest Order Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Rest. Order Line"."Total Amount" where
            ("Customer No." = field("No."))
            );
        }
    }
}