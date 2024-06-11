/// <summary>
/// Page Restaurant Order Summary FactBox (ID 50133).
/// </summary>
page 50133 "Restaurant Table FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Restaurant Table";
    Caption = 'Restaurant Table FactBox';

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Table Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Order Count"; Rec."Rest. Order Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Count field.';
                }
                field("Total Amount"; Rec."Rest. Order Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        RestTableFactboxQuery: Query "Restaurant Table FactBox Query";
    begin
        RestTableFactboxQuery.Open();
    end;
}
