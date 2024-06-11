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
        WaitTaskId: Integer;
        LineCount: Integer;
        Amount: Decimal;


    trigger OnAfterGetCurrRecord()
    var
        TaskParameters: Dictionary of [Text, Text];
    begin
        TaskParameters.Add('OrderNo', Rec."No.");
        CurrPage.EnqueueBackgroundTask(WaitTaskId, Codeunit::Unit_PBT, TaskParameters, 1000, PageBackgroundTaskErrorLevel::Warning);
        //přerušení pbt když nějaký běží
    end;

    trigger OnPageBackgroundTaskCompleted(BackgroundTaskId: Integer; Result: Dictionary of [Text, Text])
    var
        LineCountTxt: label 'Line Count';
        AmountTxt: label 'Amount';
    begin
        if BackgroundTaskId = WaitTaskId then begin
            Evaluate(LineCount, Result.Get(LineCountTxt));
            Evaluate(Amount, Result.Get(AmountTxt));
            CurrPage.Update(true);
        end;
    end;
}
