/// <summary>
/// Page MyPage (ID 50105).
/// </summary>
page 50105 "Restaurant Tables"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Restaurant Table";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Number Seats"; Rec."Number Seats")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number Seats field.';
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(RestOrderCount; Rec."Rest. Order Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Count field.';
                }
                field(RestOrderAmount; Rec."Rest. Order Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Rest. No."; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                }
            }
        }
        area(FactBoxes)
        {
            part("RestaurantOrderFactBox"; "Restaurant Order FactBox")
            {
                ApplicationArea = All;
                //SubPageLink = Code = FIELD("Code");
            }
        }
    }
}