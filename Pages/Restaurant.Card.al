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
                    ToolTip = 'Name';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'No. Series';
                    TableRelation = "No. Series";
                }
            }

        }
    }
}