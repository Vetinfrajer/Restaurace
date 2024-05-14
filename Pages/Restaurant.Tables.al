/// <summary>
/// Page MyPage (ID 50105).
/// </summary>
page 50105 "Restaurant Tables"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    /*
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; NameSource)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
*/
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                ToolTip = 'Executes the ActionName action.';
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}