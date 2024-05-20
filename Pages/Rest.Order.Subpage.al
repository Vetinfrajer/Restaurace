/// <summary>
/// Page Restaurant Order Subpage (ID 50112).
/// </summary>
page 50112 "Restaurant Order Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "rest. order line";


    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Name; Rec.name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Rest. Order No."; Rec."Rest. Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rest. Order No. field.';


                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';

                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }


            }
        }

    }
    //akce na otevření stolů
    actions
    {
        area(Processing)
        {
            action(OpenTables)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //OpenPage(Page::"Restaurant Tables");
                end;
            }
        }
    }
}