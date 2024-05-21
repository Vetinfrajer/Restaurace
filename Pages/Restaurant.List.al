/// <summary>
/// Page Rest. List (ID 50107).
/// </summary>
page 50107 "Restaurant List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Restaurant";
    CardPageId = "Restaurant Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Rest No.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}