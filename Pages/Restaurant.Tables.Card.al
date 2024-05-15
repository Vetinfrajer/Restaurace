/// <summary>
/// Page Restaurant Tables Card (ID 50136).
/// </summary>
page 50136 "Restaurant Tables Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Restaurant Table";

    layout
    {
        area(Content)
        {
            group(General)
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
                field("Rest. No."; Rec."Rest. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. No. field.';
                    TableRelation = "Restaurant"."No.";
                }
            }
        }
    }
}