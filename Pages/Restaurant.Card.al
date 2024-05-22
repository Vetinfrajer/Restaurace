/// <summary>
/// OnAction.
/// </summary>
page 50106 "Restaurant Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Restaurant";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Rest No.';
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                    end;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(count; Rec.count)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Count field.';
                }
                field(Amount; Rec.Amount)
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
            action("OpenRestaurantTables")
            {
                Caption = 'Open Restaurant Tables';
                ApplicationArea = All;
                RunObject = Page "Restaurant Tables";
                //RunPageView = "Rest. No." = Field("No.");
            }
        }
    }
}