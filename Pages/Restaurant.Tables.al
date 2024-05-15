/// <summary>
/// Page MyPage (ID 50105).
/// </summary>
page 50105 "Restaurant Tables"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Restaurant Table";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Rest.No"; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
            }
        }
    }
}