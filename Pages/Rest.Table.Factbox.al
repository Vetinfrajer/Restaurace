/// <summary>
/// Page Restaurant Order Summary FactBox (ID 50133).
/// </summary>
page 50133 "Restaurant Table FactBox"
{
    PageType = CardPart;
    SourceTable = "Restaurant Table";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Order Count"; Rec."Rest. Order Count")
                {
                    ApplicationArea = All;
                    Caption = 'Number of Orders';
                }
                field("Total Amount"; Rec."Rest. Order Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Total Order Amount';
                }
            }
        }
    }
}
