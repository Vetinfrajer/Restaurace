/// <summary>
/// Table MyTable (ID 50103).
/// </summary>
table 50103 "Rest. Order Line"
{
    DataClassification = CustomerContent;
    Caption = 'My Table';
    LookupPageId = "Rest. Order List";
    DrillDownPageId = "Rest. Order List";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            TableRelation = Item."No.";
            trigger OnValidate()
            begin
                if Rec."Item No." <> '' then
                    UpdateInfoByItemNo();

                Updateamounts();
            end;
        }
        field(2; "Rest. Order No."; Code[20])
        {
            TableRelation = "Rest. Order Header"."No.";
            Caption = 'Rest. Order No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Quantity"; Integer)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                Updateamounts();
            end;
        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            trigger OnValidate()
            begin
                Updateamounts();
            end;
        }
        field(6; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
        field(7; "Name"; Text[250])
        {
            Caption = 'Name';
            TableRelation = Item.Description;
            trigger OnValidate()
            begin
                UpdateInfoByName();
            end;
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
        LastRecord: Record "Rest. Order Line";
    begin
        if Rec."Line No." = 0 then begin
            if LastRecord.FINDLAST then
                Rec."Line No." := LastRecord."Line No.";
            rec."Line No." += 10000;
        end;
    end;
    /// <summary>
    /// UpdateInfoByItemNo.
    /// </summary>
    procedure UpdateInfoByItemNo()
    var
        ItemRecord: Record Item;
    begin
        if ItemRecord.GET(Rec."Item No.") then begin
            Rec."Unit Price" := ItemRecord."Unit Price";
            Rec."Name" := ItemRecord.Description;
        end;
    end;

    /// <summary>
    /// UpdateInfoByName.
    /// </summary>
    procedure UpdateInfoByName()
    var
        itemRecord: Record Item;
    begin
        if itemRecord.GET(Rec."Name") then begin
            Rec."Unit Price" := itemRecord."Unit Price";
            Rec."Item No." := ItemRecord."No.";
        end;


    end;
    /// <summary>
    /// Update Line Amount.
    /// </summary>
    procedure "Updateamounts"()
    begin
        Rec."Line Amount" := Rec."Quantity" * Rec."Unit Price";
    end;

}