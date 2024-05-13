/// <summary>
/// Page Restaurant Order Subpage (ID 50112).
/// </summary>
page 50112 "Restaurant Order Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Rest. Order Header";


    layout
    {
        area(Content)
        {
            group(General)
            {

                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field("Rest. Table Code"; Rec."Rest. Table Code")
                {
                    Caption = 'Restaurant Table Code';
                }
                field("Rest. No."; Rec."Rest. No.")
                {
                    Caption = 'Restaurant Number';
                }
            }
        }

    }

}