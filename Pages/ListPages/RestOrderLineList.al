/// <summary>
/// Page Restaurant Order Lines List (ID 50131).
/// </summary>
page 50131 "Restaurant Order Lines List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Rest. Order Line";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Name; Rec.name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Table No."; Rec."Rest. Table Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Table No. field.';
                }
            }
        }
    }

}