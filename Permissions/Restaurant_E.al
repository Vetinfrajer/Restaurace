
/// <summary>
/// Unknown Restaurant_E (ID 50121).
/// </summary>
permissionset 50121 "Restaurant_E"
{
    Assignable = true;
    Caption = 'Restaurant Edit';
    IncludedPermissionSets = Restaurant_R;

    Permissions = tabledata "Rest. Order Header" = IMD,
        tabledata "Rest. Order Line" = IMD,
        tabledata Restaurant = IMD,
        tabledata "Restaurant Setup" = IMD,
        tabledata "Restaurant Table" = IMD;
}