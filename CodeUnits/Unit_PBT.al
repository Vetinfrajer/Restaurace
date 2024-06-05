/// <summary>
/// OnRun.
/// </summary>
/*
codeunit 50136 "Unit_PBT"
{
    var
        RestNoInput: Code[20];
        AmountOutput: Decimal;
        CountOutput: Integer;

    trigger OnRun()
    var
        RestOrderHeader: Record "Rest. Order Header";
        TotalAmount: Decimal;
        TotalCount: Integer;
    begin
        //Nastavení rozsahu
        RestOrderHeader.SetRange("Rest. No.", RestNoInput);
        TotalCount := RestOrderHeader.Count;
        RestOrderHeader.CALCFIELDS("Amount");
        TotalAmount := RestOrderHeader."Amount";

        //Přiřazení výstupů
        AmountOutput := TotalAmount;
        CountOutput := TotalCount;

        SaveResult(AmountOutput, CountOutput);
    end;
    /// <summary>
    /// SetParameters.
    /// </summary>
    /// <param name="RestNo">Code[20].</param>
    /// <returns>Return value of type begin.</returns>
    procedure SetParameters(RestNo: Code[20])
    begin
        RestNoInput := RestNo;
    end;

    /// <summary>
    /// SaveResult.
    /// </summary>
    /// <param name="Amount">Decimal.</param>
    /// <param name="Count">Integer.</param>
    procedure SaveResult(Amount: Decimal; Count: Integer)
    var
        BackgroundSession: Record "Background Session";
    begin
        BackgroundSession.SetParameters(AmountOutput, Amount);
        BackgroundSession.SetParameters(CountOutput, Count);
    end;
}*/