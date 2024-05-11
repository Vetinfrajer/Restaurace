/// <summary>
/// Page MyPage (ID 50105).
/// </summary>
page 50105 "Rest. tables"
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}