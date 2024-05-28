
/// <summary>
/// PageExtension Cust.Ext (ID 50119) extends Record Customer Card.
/// </summary>
pageextension 50119 "Cust.Card.Ext" extends "Customer Card"
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
