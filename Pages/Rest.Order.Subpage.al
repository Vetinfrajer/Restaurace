/// <summary>
/// Page Restaurant Order Subpage (ID 50112).
/// </summary>
page 50112 "Restaurant Order Subpage"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}