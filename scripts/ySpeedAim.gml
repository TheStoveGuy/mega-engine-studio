/*This script does something different than xSpeedAim. It sets yspeed to the value needed to exactly reach a
certain height with the given values*/

//argument0 - height to reach
//argument1 - gravitationalAcceleration

_y = argument0;
_accel = argument1;

//save direction we're going so it can be applied after square rooting
dir = 0;
if (_accel > 0)
{
    dir = -1;
}
else
{
    dir = 1;
}

//if what we're going is behind where we're jumping at, then jump a default height
if ((dir < 0 && _y > y) || (dir > 0 && _y < y))
{
    _y = y + 24 * dir;
}

//calculate
_accel = abs(_accel);

substitution = 2 * _accel * abs(_y - y);

if (substitution <= 0)
{
    exit;
}

yspeed = sqrt(substitution) * dir;
