/// <summary>
/// Unknown Restaurant Read (ID 50120).
/// </summary>
permissionset 50120 "Restaurant_R"

// RIMD=práva: read, insert, modify, delete, execute (RIMDX)
{
    Assignable = true;
    Caption = 'Restaurant Read';

    Permissions = tabledata "Rest. Order Header" = R,
        tabledata "Rest. Order Line" = R,
        tabledata Restaurant = R,
        tabledata "Restaurant Setup" = R,
        tabledata "Restaurant Table" = R,
        table "Rest. Order Header" = X,
        table "Rest. Order Line" = X,
        table Restaurant = X,
        table "Restaurant Setup" = X,
        table "Restaurant Table" = X,
        page "Restaurant Card" = X,
        page "Restaurant List" = X,
        page "Restaurant Order" = X,
        page "Restaurant Order List" = X,
        page "Restaurant Order Subpage" = X,
        page "Restaurant Setup" = X,
        page "Restaurant Table FactBox" = X,
        page "Restaurant Tables" = X,
        page "Role Center HeadLine" = X,
        page RoleCenter = X;
}

//included permission set