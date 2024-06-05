/// <summary>
/// Codeunit BackgroundTaskRunner (ID 50124).
/// </summary>
/*
codeunit 50124 BackgroundTaskRunner
{
/// <summary>
/// RunBackgroundTask.
/// </summary>
/// <param name="CodeunitID">Integer.</param>
/// <param name="FunctionName">Text[100].</param>
/// <param name="RestNo">code[20].</param>
/// <param name="AmountOutput">VAR Decimal.</param>
/// <param name="CountOutput">VAR Integer.</param>
procedure RunBackgroundTask(CodeunitID: Integer; FunctionName: Text[100];
RestNo: code[20]; var AmountOutput: Decimal; var CountOutput: Integer)
var
    BackgroundSession: Record "Background Session";
    TaskScheduler: Codeunit "Task Scheduler";
    Unit_PBT: Codeunit "Unit_PBT";
begin
    Unit_PBT.SetParameters(RestNo);

    TaskScheduler.ScheduleTask(BackgroundSession, CodeunitID, FunctionName);

    BackgroundSession.GetParameters('CountOutput', CountOutput);
    BackgroundSession.GetParameters('AmountOutput', AmountOutput);
end;

}*/