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
            group(Vitej)
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
    }
}

// Creates a profile that uses the Role Center
profile MyProfile
{
    ProfileDescription = 'Sample Profile';
    RoleCenter = RoleCenter;
    Caption = 'My profile';
}