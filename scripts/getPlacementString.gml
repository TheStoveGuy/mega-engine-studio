//getPlacementString();

var num,re;
num = argument0;
re = string(num);

if !(num<14 && num>10)
{
    switch(num mod 10)
    {
        case 1:
            re += "st"; break;
        case 2:
            re += "nd"; break;
        case 3:
            re += "rd"; break;
        default:
            re += "th"; break;
    }
}
else {re += "th";}

if num <= 3
{
    re = string_upper(re+" place");
    if num = 1 && object_index != objPauseMenu
    {
        re = "/C2"+re+"/C0";
    }
}

if num = 81
{
    re = "DISQUALIFIED";
    if object_index != objPauseMenu
    {
        re = "/C1"+re+"/C0";
    }
}

return(re);
