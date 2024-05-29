/// <summary>
/// Table MyTable (ID 50103).
/// </summary>
table 50103 "Rest. Order Line"
{
    DataClassification = CustomerContent;
    Caption = 'My Table';
    //LookupPageId = rest order line page ;
    DrillDownPageId = "Rest. Order List";

    fields
    {
        field(1; "Rest. Order No."; Code[20])
        {
            TableRelation = "Rest. Order Header"."No.";
            Caption = 'Rest. Order No.';
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(3; "Name"; Text[50])
        {
            Caption = 'Name';
        }

        field(4; "Quantity"; Integer)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }

        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }

        field(6; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }

        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
            trigger OnValidate()
            begin
                UpdateInfoByItemNo();
            end;
        }
        field(8; "Rest. Table Code"; Code[20])
        {
            Caption = 'Table No.';
            TableRelation = "Restaurant Table";
        }
        field(9; "Rest. No."; Code[20])
        {
            Caption = 'Rest. No.';
            TableRelation = "Restaurant";
        }
        field(10; "Discount %"; Decimal)
        {
            Caption = 'Discount';
            trigger OnValidate()
            begin
                UpdateAmounts();
            end;
        }
        field(11; "Discount amount"; Decimal)
        {
            Caption = 'Discount amount';
        }
        field(12; "Line amount"; Decimal)
        {
            Caption = 'Line amount';
            Editable = false;
        }
        field(13; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
    }
    keys
    {
        key(PK; "Rest. Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        RestOrderLine: Record "Rest. Order Line";
        RestOrderHeader: Record "Rest. Order Header";
    begin
        RestOrderLine.SetRange("Rest. Order No.", Rec."Rest. Order No.");
        if Rec."Line No." = 0 then
            Rec."Line No." := 10000
        else
            if RestOrderLine.FindLast then
                Rec."Line No." := RestOrderLine."Line No.";
        Rec."Line No." += 10000;

        if not RestOrderHeader.GET() then begin
            Rec."Customer No." := RestOrderHeader."Customer No.";
            Rec."Rest. No." := RestOrderHeader."Rest. No.";
            Rec."Rest. Table Code" := RestOrderHeader."Rest. Table Code";
        end;

    end;


    /// <summary>
    /// UpdateInfoByItemNo.
    /// </summary>
    procedure UpdateInfoByItemNo()
    var
        Item: Record Item;
    begin
        if Item.GET(Rec."Item No.") then begin
            Rec."Name" := Item.Description;
            Rec.Validate("Unit Price", Item."Unit Price");
        end
        else begin
            Rec."Name" := '';
            Rec.Validate("Unit Price", 0);
        end;
    end;
    /// <summary>
    /// Update Line Amount.
    /// </summary>
    procedure UpdateAmounts()
    begin
        Rec."Line amount" := Rec."Quantity" * Rec."Unit Price";
        Rec."Discount amount" := (Rec."Line amount" / 100) * Rec."Discount %";
        "Total Amount" := Rec."Line amount" - Rec."Discount amount";
    end;


}