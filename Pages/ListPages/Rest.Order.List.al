/// <summary>
/// Page Restaurant Order List (ID 50111).
/// </summary>
page 50111 "Restaurant Order List"
{

    ApplicationArea = All;
    UsageCategory = Lists;
    pagetype = List;
    SourceTable = "Rest. Order Header";
    CardPageId = "Restaurant Order";
    Caption = 'Restaurant Order List';
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Rest. No."; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Table Code"; Rec."Rest. Table Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. Table Code field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Restaurant name"; Rec."Rest. name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. name field.';
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
