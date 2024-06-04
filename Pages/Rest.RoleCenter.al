/// <summary>
/// Page RoleCenter (ID 50110).
/// </summary>
page 50113 RoleCenter
{
    PageType = RoleCenter;
    Caption = 'My Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Wellcome)
            {
                part(Part1; "Role Center HeadLine")
                {
                    ApplicationArea = All;
                    Caption = 'Pokus';
                }
            }
        }
    }


    actions
    {
        area(Sections)
        {
            group(Restaurant)
            {
                Caption = 'Restaurant';
                Image = RegisteredDocs;
                action("Restaurant List")
                {
                    Caption = 'Restaurant List';
                    RunObject = Page "Restaurant List";
                    ApplicationArea = All;
                    ToolTip = 'Executes the Restaurant List action.';
                }
                action("Restaurant Order List")
                {
                    Caption = 'Restaurant Order List';
                    RunObject = Page "Restaurant Order List";
                    ApplicationArea = All;
                    ToolTip = 'Executes the Restaurant Order List action.';
                }
                action("Restaurant Setup")
                {
                    Caption = 'Restaurant Setup';
                    RunObject = Page "Restaurant Setup";
                    ApplicationArea = All;
                    ToolTip = 'Executes the Restaurant Setup action.';
                }
            }
        }

        /*area(Embedding)
        {

            action(Sales)
            {
                Caption = 'Sales lists';
                RunObject = Page "Sales list";
                ApplicationArea = All;
            }

            action(Services)
            {
                Caption = 'Service lists';
                RunObject = Page "Service list";
                ApplicationArea = All;

            }
        }

        area(Processing)
        {
            action(SeeSalesInvoices)
            {
                Caption = 'See Sales Invoices';
                RunObject = Page "Posted Sales Invoices";
            }
        }

        area(Creation)
        {
            action(AddSalesInvoice)
            {
                Caption = 'Add Sales Invoice';
                Image = NewInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
            }
        }

        area(Reporting)
        {
            action(SalesInvoicesReport)
            {
                Caption = 'Sales Invoices Report';
                Image = "Report";
                RunObject = Report "Sales - Invoice";
            }
        }*/
    }
}

// Creates a profile that uses the Role Center
profile MyProfile
{
    ProfileDescription = 'Sample Profile';
    RoleCenter = RoleCenter;
    Caption = 'My profile';
}