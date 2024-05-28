/// <summary>
/// PageExtension Cust.List.Ext (ID 50132) extends Record Customer List.
/// </summary>
pageextension 50132 "Cust.List.Ext" extends "Customer List"
{
    layout
    {
        addlast(Content)
        {
            field("Rest Order Count"; Rec."Rest Order Count")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of outstanding orders for the customer.';
            }
            field("Rest Order Amount"; Rec."Rest Order Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of outstanding orders for the customer.';
            }
        }
    }
}