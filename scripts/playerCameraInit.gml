///playerCameraInit(newSectionXOffset,newSectionYOffset)
//Initialize the camera
//For the meanings of newSectionXOffset/newSectionYOffset, see playerSwitchSections

var dist,xdist,ydist,i;
i = 1;
newSectionXOffset = argument0;
newSectionYOffset = argument1;

//Left
dist = floor((x+newSectionXOffset)/16)*16;
while !place_meeting(dist,y+newSectionYOffset,objSectionBorderHorizontal)
{
    dist -= 16;
    if dist < 0 //If hitting left border
    {
        global.sectionLeft = 0;
        i = 0; break;
    }
}
if i {global.sectionLeft = instance_place(dist, y+newSectionYOffset, objSectionBorderHorizontal).x;}
i = 1;

//Right
dist = ceil((x+newSectionXOffset)/16)*16;
while !place_meeting(dist,y+newSectionYOffset,objSectionBorderHorizontal)
{
    dist += 16;
    if dist > room_width //If hitting right border
    {
        global.sectionRight = room_width;
        i = 0; break;
    }
}
if i {global.sectionRight = instance_place(dist,y+newSectionYOffset,objSectionBorderHorizontal).x;}
i = 1;

//Top
dist = floor((y+newSectionYOffset)/16)*16;
while !place_meeting(x+newSectionXOffset,dist,objSectionBorderVertical)
{
    dist -= 16;
    if dist < 0 //If hitting upper border
    {
        global.sectionTop = 0;
        i = 0; break;
    }
}
if i {global.sectionTop = instance_place(x+newSectionXOffset,dist,objSectionBorderVertical).y;}
i = 1;

//Bottom
dist = ceil((y+newSectionYOffset)/16)*16;
while !place_meeting(x+newSectionXOffset,dist,objSectionBorderVertical)
{
    dist += 16;
    if dist > room_height //If hitting lower border
    {
        global.sectionBottom = room_height;
        i = 0; break;
    }
}
if i {global.sectionBottom = instance_place(x+newSectionXOffset,dist,objSectionBorderVertical).y;}
