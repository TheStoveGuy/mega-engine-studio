var subxspeed,oldbox;
subxspeed = xspeed;

generalCollision();

if xspeed = 0
{
    if xspeed != subxspeed
    {
        xspeed = -subxspeed;
        oldbox = bbox_left;
        image_xscale = -image_xscale;
        x += oldbox-bbox_left;
    }
}
