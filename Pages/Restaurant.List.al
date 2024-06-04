/// <summary>
/// Page Rest. List (ID 50107).
/// </summary>
page 50107 "Restaurant List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Restaurant";
    CardPageId = "Restaurant Card";

    layout
    {

        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Count; Rec.Count)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Count field.';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("RestaurantTables")
            {
                Caption = 'Restaurant Tables';
                ApplicationArea = All;
                RunObject = Page "Restaurant Tables";
                RunPageView = sorting(Code) order(ascending);
                RunPageLink = "Rest. No." = field("No.");
                RunPageMode = Edit;
            }
        }
    }
}
