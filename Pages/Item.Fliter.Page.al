/// <summary>
/// Page Item Filter Page (ID 50138).
/// </summary>
page 50138 "Item Filter Page"
{
    PageType = Card;
    ApplicationArea = All;
    Editable = true;
    SourceTable = "Restaurant Table";

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Item Filter"; Rec."Item Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item number to filter the list.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OK)
            {
                ApplicationArea = All;
                Caption = 'OK';
                trigger OnAction()
                begin
                    CurrPage.Close;
                end;
            }
            action(Cancel)
            {
                ApplicationArea = All;
                Caption = 'Cancel';
                trigger OnAction()
                begin
                    CurrPage.Close;
                end;
            }
        }
    }
}