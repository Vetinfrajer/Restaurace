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
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
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
        area(Processing)
        {
            group(releaseGroup)
            {

                ShowAs = splitbutton;
                action("ReleaseAction")
                {
                    Caption = 'Release';
                    ApplicationArea = All;
                    Image = ReleaseDoc;
                    trigger OnAction()
                    begin
                        Rec.Closed := true;
                        Rec.Modify();
                    end;
                }
                action("ReOpen")
                {
                    Caption = 'Open';
                    ApplicationArea = All;
                    Image = ReOpen;
                    trigger OnAction()
                    begin
                        Rec.Closed := false;
                        Rec.Modify();
                    end;
                }
            }
        }
        area(Promoted)
        {

        }
    }
    trigger OnOpenPage()
    begin
        Rec.Closed := false;
    end;
}

