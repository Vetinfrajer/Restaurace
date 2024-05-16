/// <summary>
/// Page Restaurant Order List (ID 50111).
/// </summary>
page 50111 "Rest. Order List"
{

    ApplicationArea = All;
    UsageCategory = Lists;
    pagetype = List;
    SourceTable = "Rest. Order Header";
    CardPageId = "Rest. Order";
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
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }

            }

        }
    }


}
