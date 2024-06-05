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
                Editable = RestOrderEditable;
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
        area(FactBoxes)
        {
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                ApplicationArea = all;
                UpdatePropagation = Both;
                SubPageLink = "No." = FIELD("Customer No.");
            }
            part("Item Invoicing FactBox"; "Item Invoicing FactBox")
            {
                ApplicationArea = all;
                UpdatePropagation = Both;
                Provider = Lines;
                SubPageLink = "No." = field("Item No.");
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
                action("ReleaseOrder")
                {
                    Caption = 'Release';
                    ApplicationArea = All;
                    Enabled = not Rec.Closed;
                    Image = ReleaseDoc;
                    ToolTip = 'Executes the Release action.';
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
                    ToolTip = 'Executes the Open action.';
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
            group(Category_Process)
            {
                showAs = SplitButton;
                actionref("ReleaseOrder_Promoted"; ReleaseOrder)
                {

                }
                actionref("ReOpenOrder_Promoted"; ReOpenOrder)
                {

                }
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        SetOrderEditable();
    end;

    var
        RestOrderEditable: Boolean;

    /// <summary>
    /// UpdateRestOrderEditable.
    /// </summary>
    procedure SetOrderEditable()
    begin
        RestOrderEditable := not Rec.Closed;
    end;
}
