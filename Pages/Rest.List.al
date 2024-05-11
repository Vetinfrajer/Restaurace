/// <summary>
/// Page Rest. List (ID 50107).
/// </summary>
page 50107 "Rest. List"
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