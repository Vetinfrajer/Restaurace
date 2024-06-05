/// <summary>
/// Page MyPage (ID 50137).
/// </summary>
page 50137 "Restaurant FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Rest. Order Header";

    layout
    {
        area(Content)
        {
            group("Count & Amount")
            {
                field("Line Count"; LineCount)
                {
                    ApplicationArea = All;
                    Caption = 'Line Count';
                    ToolTip = 'Specifies the value of the Line Count field.';
                }
                field("Amount"; Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
    var
        LineCount: Integer;
        Amount: Decimal;
    /*
        trigger OnOpenPage()
        var
            BackgroundTask: Codeunit BackgroundTaskRunner;
            RestNo: Code[20];
            AmountOutput: decimal;
            CountOutput: integer;
        begin
            RestNo := Rec."Rest. No.";

            BackgroundTask.RunBackgroundTask(Codeunit::Unit_PBT, 'ProcessData', RestNo, AmountOutput, CountOutput);

            LineCount := CountOutput;
            Amount := AmountOutput;

        end;*/
}