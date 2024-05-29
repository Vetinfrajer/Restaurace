/// <summary>
/// Page Restaurant Order Summary FactBox (ID 50133).
/// </summary>
page 50133 "Restaurant Order FactBox"
{
    PageType = CardPart;
    SourceTable = "Restaurant Table";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Order Count"; OrderCount)
                {
                    ApplicationArea = All;
                    Caption = 'Number of Orders';
                }
                field("Total Amount"; TotalAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Order Amount';
                }
            }
        }
    }

    VAR
        OrderCount: Integer;
        TotalAmount: Decimal;

    trigger OnAfterGetRecord()
    var
        RestOrderHeader: Record "Rest. Order Header";
        RestOrderLine: Record "Rest. Order Line";
    begin
        OrderCount := 0;
        TotalAmount := 0.0;

        RestOrderHeader.SetRange(RestOrderHeader."Rest. No.", RestOrderLine."Rest. No."); // Assume there's a relationship on Restaurant No.

        if RestOrderHeader.FindSet() then begin
            repeat
                OrderCount := OrderCount + 1;
                RestOrderLine.SetRange("Rest. Order No.", RestOrderHeader."No.");
                if RestOrderLine.FindSet() then begin
                    repeat
                        TotalAmount := TotalAmount + RestOrderLine."Total Amount";
                    until RestOrderLine.Next() = 0;
                end;
            until RestOrderHeader.Next() = 0;
        end;
    end;
}
