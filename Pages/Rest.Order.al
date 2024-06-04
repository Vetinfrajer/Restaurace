/// <summary>
/// Page Restaurant Order (ID 50110).
/// </summary>
page 50110 "Restaurant Order"
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
                    Enabled = RestOrderEditable;
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
                    Enabled = RestOrderEditable;
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
                    Enabled = RestOrderEditable;
                }
                field("Rest. Table Code"; Rec."Rest. Table Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. Table Code field.';
                    Enabled = RestOrderEditable;
                }
                field("Rest. Name"; Rec."Rest. Name")
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
                field("Closed"; Rec."Closed")
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
                Enabled = RestOrderEditable;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(ReleaseAction)
            {
                Caption = 'Order Actions';
                ShowAs = SplitButton;
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
                action("StartBackgroundTask")
                {
                    Caption = 'Start Background Task';
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        if Codeunit.Run(Codeunit::"Unit_PBT") then
                            Message('Background task started successfully.');
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

    trigger OnOpenPage()
    begin
        UpdateRestOrderEditable();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateRestOrderEditable();
    end;

    var
        RestOrderEditable: Boolean;
    /// <summary>
    /// UpdateRestOrderEditable.
    /// </summary>

    procedure UpdateRestOrderEditable()
    begin
        RestOrderEditable := not Rec.Closed;
    end;
}
