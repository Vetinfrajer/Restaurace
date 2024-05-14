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
                    TableRelation = "Customer"."No.";
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Rest. Table Code"; Rec."Rest. Table Code")
                {
                    ApplicationArea = All;
                    TableRelation = "Restaurant Table"."Code";
                    ToolTip = 'Specifies the value of the Rest. Table Code field.';
                }
                field("Rest. No."; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    TableRelation = "Restaurant"."No.";
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    TableRelation = "Rest. Order Header"."No. Series";
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
            part("Lines"; "Restaurant Order Subpage")
            {
                ApplicationArea = All;
            }
        }

    }
}
