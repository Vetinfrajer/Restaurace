/// <summary>
/// Page Rest. Setup Page (ID 50117).
/// </summary>
page 50117 "Restaurant Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Restaurant Setup";


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Restaurant Nos."; Rec."Restaurant Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Restaurant Nos. field.';
                }
            }
        }
    }


}