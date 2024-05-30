/// <summary>
/// Page Restaurant Order (ID 50110).
/// </summary>
page 50110 "Rest. Order"
{
    ApplicationArea = All;
    UsageCategory = none;
    pagetype = Document;
    SourceTable = "Rest. Order Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                    end;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    Importance = promoted;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Rest. No."; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                }
                field("Rest. Table Code"; Rec."Rest. Table Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. Table Code field.';
                }
                field("Rest. Name"; Rec."Rest. name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. Name field.';
                }
                field(LineCount; Rec."Line Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Count field.';
                    Importance = promoted;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                    Importance = promoted;
                }
                field("Release"; Rec."Closed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
            }
            part("Lines"; "Restaurant Order Subpage")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
                SubPageLink = "Rest. Order No." = FIELD("No.");
            }
        }
    }
    actions
    {
        area(Creation)
        {
            group(ReleaseAction)
            {
                Caption = 'Order Actions';
                action("ReleaseOrder")
                {
                    Caption = 'Release';
                    ApplicationArea = All;
                    Enabled = not Rec.Closed;
                    Image = ReleaseDoc;
                    trigger OnAction()
                    begin
                        Rec.Release();
                        CurrPage.Update(false);
                    end;
                }
                action("ReOpenOrder")
                {
                    Caption = 'Open';
                    ApplicationArea = All;
                    Image = ReOpen;
                    Enabled = Rec.Closed;
                    trigger OnAction()
                    begin
                        Rec.ReOpen();
                        CurrPage.Update(false);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                showAs = SplitButton;
            }
        }
    }
}

