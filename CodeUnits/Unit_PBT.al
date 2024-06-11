/// <summary>
/// OnRun.
/// </summary>
codeunit 50146 "Unit_PBT"
{
    trigger OnRun()
    var
        Result: Dictionary of [Text, Text];
        OrderNo: Text;
        RestOrderLine: Record "Rest. Order Line";
        LineCount: Integer;
        TotalAmount: Decimal;
    begin
        OrderNo := Page.GetBackgroundParameters().Get('OrderNo');

        RestOrderLine.SetRange("Rest. Order No.", OrderNo);
        if RestOrderLine.FindSet() then begin
            repeat
                LineCount += 1;
                RestOrderLine.CalcFields("Total Amount");
                TotalAmount += RestOrderLine."Total Amount";
            until RestOrderLine.Next() = 0;
        end;
        Result.Add('LineCount', Format(LineCount));
        Result.Add('Amount', Format(TotalAmount));

        Page.SetBackgroundTaskResult(Result);
    end;

}
