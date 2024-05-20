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
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Rest. Table Code"; Rec."Rest. Table Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. Table Code field.';
                }
                field("Rest. No."; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
            part("Lines"; "Restaurant Order Subpage")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
                //SubPageLink = "Restaurant Order Subpage";

            }
        }
    }
}

