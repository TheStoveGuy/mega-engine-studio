//This script sets xspeed to the appropriate amount to aim at the object given in argument0 with the given information
//argument0 - object to aim at
//argument1 - this object's initial yspeed
//argument2 - gravitationalAcceleration

_obj = argument0;
_ySpd = argument1;
_accel = argument2;

if (instance_exists(argument0) && _accel != 0 && _ySpd != 0)
{
    //figure out how far up we can go
    airTime = (0 - _ySpd) / _accel;
    
    if (airTime < 0)
    {
        airTime = 0;
    }
    
    maxYDelta = _ySpd * airTime + 0.5 * _accel * power(airTime, 2);
    
    //figure out how high we need to go
    yDelta = _obj.y - y;
    
    //check to see if the object's y is too high to hit
    if ((maxYDelta < 0 && yDelta < maxYDelta) || (maxYDelta > 0 && yDelta > maxYDelta))
    {//pretend the object is just in our reach
        if (maxYDelta < 0)
        {
            yDelta = maxYDelta + 1;
        }
        else
        {
            yDelta = maxYDelta - 1;
        }
    }
    
    substitution = power(_ySpd, 2) - 4 * (_accel / 2) * (-yDelta);
    
    if (substitution <= 0)
    {
        exit;
    }
    
    //figure out time it'll take for the projetile's y to reach the same as the target
    airTime = ( -_ySpd + sqrt(substitution) ) / _accel;
    
    //if the answer given is nonsense, then try subtracting the quadratic instead of adding
    if (airTime <= 0)
    {
        airTime = ( -_ySpd - sqrt(substitution) ) / _accel;
        //if still nonsense somehow, then quit
        if (airTime <= 0)
        {
            exit;
        }
    }
    
    //calculate speed needed to reach target in the given time with the given distance
    xDelta = _obj.x - x;
    xspeed = xDelta / airTime;
}
