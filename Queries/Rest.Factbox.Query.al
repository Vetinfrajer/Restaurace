/*
query 50147 "Restaurant FactBox Query"
{
    QueryType = normal;

    elements
    {
        dataitem(Restaurant; Restaurant)
        {
            column(Name; Name)
            {
                Caption = 'Restaurant Name';
            }
            column(TotalOrders; Integer)
            {
                Caption = 'Total Orders';
                Method = Count;
                DataItemTableView = SORTING(No);
            }
            column(TotalAmount; Decimal)
            {
                Caption = 'Total Amount';
                Method = Sum;
                DataItemTableView = SORTING(No);
                CalcFormula = Sum("Rest. Order Header"."Amount" where ("Rest. No." = field("No.")));
            }
        }
    }
}*/