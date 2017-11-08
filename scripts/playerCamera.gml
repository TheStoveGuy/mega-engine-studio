///playerCamera()
//Handles the camera

var vx = 0;
var vy = 0;
var vz = 0;

with objMegaman
{
    if viewplayer
    {
        vx += x;
        vy += y;
        vz += 1;
    }
}

//Follow the player
if vz
{
    view_xview = round(vx/vz - view_wview*0.5);
    view_yview = round(vy/vz - view_hview*0.5);
}

//Stop at section borders
//view_xview = max(global.sectionLeft,min(view_xview,global.sectionRight-view_wview));
//view_yview = max(global.sectionBottom,min(view_yview,global.sectionTop-view_hview));
if view_xview > global.sectionRight-view_wview
{
    view_xview = global.sectionRight-view_wview;
}
else if view_xview < global.sectionLeft
{
    view_xview = global.sectionLeft;
}
if view_yview > global.sectionBottom-view_hview
{
    view_yview = global.sectionBottom-view_hview;
}
else if view_yview < global.sectionTop
{
    view_yview = global.sectionTop;
}
