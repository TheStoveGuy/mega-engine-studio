/// blowPlayer(xspeed,yspeed)
// blows player as if by wind according to the provided vector
// must be called by objMegaman or in a with statement

if !climbing && !teleporting
{
    xs = xspeed;
    ys = yspeed;
    xspeed = argument0;
    yspeed = argument1;
    playerCollision();
    x += xspeed;
    xspeed = xs;
    yspeed = ys;
}
