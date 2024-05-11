/// <summary>
/// Page Restaurant Order List (ID 50111).
/// </summary>
page 50111 "Restaurant Order List"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    pagetype = List;
    SourceTable = "Rest.Ordr.Line";
    CardPageId = "Restaurant Order";

    layout
    {
        area(content)
        {
            repeater(Repeater)
            {
                field(Name; Rec.name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Name';
                }
                field("Rest. Order No."; Rec."Rest. Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'Rest. Order No.';
                    ToolTip = 'Rest. Order No.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                    ToolTip = 'Line No.';
                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                    ToolTip = 'Quantity';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Price';
                    ToolTip = 'Unit Price';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Line Amount';
                    ToolTip = 'Line Amount';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    ToolTip = 'Item No.';
                }
            }
        }
    }
}
