/// <summary>
/// OnRun.
/// </summary>
codeunit 50147 "RestOrderEventHandler"
{
    [EventSubscriber(ObjectType::Table, Database::"Rest. Order Header",
    'onBeforeRelease', '', false, false)]
    local procedure HandleOnBeforeRelease(var Rec: Record "Rest. Order Header";
     var IsHandled: Boolean)
    var
        ConfirmRelease: boolean;
        ConfirmTxt: Label 'Do you want to release the order?';
        ReleaseCanceledTxt: Label 'Order release canceled by the user';
    begin
        if GuiAllowed then
            ConfirmRelease := Confirm(ConfirmTxt);
        if not ConfirmRelease then begin
            IsHandled := true;
            Error(ReleaseCanceledTxt);
        end;
        //IsHandled := false;
    end;
}