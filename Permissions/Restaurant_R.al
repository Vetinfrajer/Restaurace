/// <summary>
/// Unknown Restaurant_R (ID 50100).
/// </summary>
permissionset 50136 "Restaurant_R"
{
    Caption = 'Restaurant Read';

    Permissions =
        tabledata "Restaurant Table" = R,
        tabledata "Rest. Order Header" = R,
        tabledata "Rest. Order Line" = R;
}
