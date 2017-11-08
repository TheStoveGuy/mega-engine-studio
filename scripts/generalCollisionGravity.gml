var subyspeed,subground;
subyspeed = yspeed;
subground = ground;

generalCollision();

subground = ground;
if yspeed != subyspeed
{
    if yspeed*global.GravityDir > 0
    {
        ground = true;
    }
}
