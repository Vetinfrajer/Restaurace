/// <summary>
/// Page Rest. Setup Page (ID 50117).
/// </summary>
page 50117 "Restaurant Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Restaurant Setup";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Restaurant Nos."; Rec."Restaurant Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Restaurant Nos. field.';
                }
                field("Restaurant Order Nos."; Rec."Restaurant Order Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Restaurant Order Nos. field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        LastRecord: Record "Restaurant Setup";
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}