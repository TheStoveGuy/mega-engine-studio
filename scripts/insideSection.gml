//insideSection(x,y)

var _X, _Y;
_X = argument0;
_Y = argument1;

if _Y <= global.sectionBottom && _Y >= global.sectionTop
&& _X <= global.sectionRight && _X >= global.sectionLeft
{
    return true;
}
else
{
    return false;
}
