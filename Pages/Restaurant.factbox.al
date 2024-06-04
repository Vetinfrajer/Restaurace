/// <summary>
/// Page MyPage (ID 50137).
/// </summary>
page 50137 "Restaurant FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Rest. Order Header";
    Caption = 'Restaurant FactBox';

    layout
    {
        area(Content)
        {
            group("Count & Amount")
            {
                field("Line Count"; Rec."Line Count")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}