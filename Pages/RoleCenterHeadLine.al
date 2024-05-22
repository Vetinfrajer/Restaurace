/// <summary>
/// Page RoleCenterHeadline (ID 50109).
/// </summary>
page 50109 "Role Center HeadLine"
{
    PageType = HeadLinePart;

    layout
    {
        area(content)
        {
            field(Headline1; hdl1Txt)
            {
                ToolTip = 'Specifies the value of the hdl1Txt field.';

            }
            field(Headline2; hdl2Txt)
            {
                ToolTip = 'Specifies the value of the hdl2Txt field.';

            }
            /*field(Headline3; hdl3Txt)
            {

            }
            field(Headline4; hdl4Txt)
            {

            }*/
        }
    }

    var
        hdl1Txt: Label 'Dobrý den!';
        hdl2Txt: Label 'Vítejte v rezeravčním systému restaurací';
    /*hdl3Txt: Label 'This is Restaurant 3';
    hdl4Txt: Label 'This is Restaurant 4';*/
}