///shiftObject(x shift,y shift,check Platforms?,Object to move, Gravity Direction 1 = down -1 = up);
// This code shifts an object && checks for objects, it's basically meant to make your life easier without having to call multiple scripts.


var _X, _Y, _Plat, _Object, _Grav;

_X = argument0;
_Y = argument1;
_PlatformCheck = argument2;
_Object = argument3;
_Grav = argument4;

if _Object != id
{
    _Object._X = _X;
    _Object._Y = _Y;
    _Object._PlatformCheck = _PlatformCheck;
    _Object._Object = _Object;
    _Object._Grav = _Grav;
}

with _Object // we gotta make this apply to the object otherwise they'll have the wrong collision masks.
{
    // X shift Note: we're ignoring platforms because they're irrelevent to the X axis
    
    if _X != 0
    {
        spike = place_meeting(x+_X, y, objSpike)
        if ((!place_meeting(x+_X,y,objSolid) && !place_meeting(x+_X,y,prtMovingPlatformSolid)) || spike)
        {
            shift = !spike;
            
            //move megaman into spikes to kill him
            if (spike && _Object == objMegaman)
            {
                if (objMegaman.canHit && global.playerHealth[player_id] > 0)
                {
                    shift = true;
                }
            }
            
            if (shift)
            {
                x += _X;
            }
        }
        else // this next line moves the object until it can't anymore
        {
            while (place_meeting(x+_X,y,objSolid) || place_meeting(x+_X,y,prtMovingPlatformSolid))
            && (!place_meeting(x+sign(_X),y,objSolid) && !place_meeting(x+sign(_X),y,prtMovingPlatformSolid))
            {
                x += sign(_X);
            }
        }
    }
    // Y shift
    if _Y != 0
    {
        spike = place_meeting(x, y + _Y, objSpike);
        
        /*
        lemmie just... disect this hell for you. Doesn't check for collisions if _PlatformCheck is false or if it's a spike (you fall through spikes,
        or else the code to kill you wouldn't happen), it detects semisolids when the top / bottom (depending on gravity) is going to move into one,
        but only from the direction gravity would pull you into it, and only if you're not already inside of one (so they are only solid on the ends
        of their top/bottom).
        */
        if ((!place_meeting(x,y+_Y,objSolid) && !place_meeting(x,y,prtMovingPlatformSolid)
                && ((((!collision_rectangle(bbox_left, bbox_bottom + _Y - 1, bbox_right, bbox_bottom + _Y, objTopSolid, false, false) && sign(_Y) == _Grav && _Grav > 0)
                    || (!collision_rectangle(bbox_left, bbox_top + _Y, bbox_right, bbox_top + _Y + 1, objTopSolid, false, false) && sign(_Y) == _Grav && _Grav < 0))
                    || sign(_Y) != _Grav || collision_rectangle(bbox_left, bbox_top + 1, bbox_right, bbox_bottom - 1, objTopSolid, false, false)) || !_PlatformCheck)
                && ((((!collision_rectangle(bbox_left, bbox_bottom + _Y - 1, bbox_right, bbox_bottom + _Y, prtMovingPlatformJumpthrough, false, false) && sign(_Y) == _Grav && _Grav > 0)
                    || (!collision_rectangle(bbox_left, bbox_top + _Y, bbox_right, bbox_top + _Y + 1, prtMovingPlatformJumpthrough, false, false) && sign(_Y) == _Grav && _Grav < 0))
                    || sign(_Y) != _Grav || collision_rectangle(bbox_left, bbox_top + 1, bbox_right, bbox_bottom - 1, prtMovingPlatformJumpthrough, false, false)) || !_PlatformCheck)) || spike
                /*
            || (((!place_meeting(x,y+_Y,objSolid) && !place_meeting(x,y,prtMovingPlatformSolid)
                && (((!place_meeting(x,y+_Y,objTopSolid) && sign(_Y) == _Grav) || place_meeting(x,y,objTopSolid)) || !_PlatformCheck)
                && (((!place_meeting(x,y+_Y,prtMovingPlatformJumpthrough) && sign(_Y) == _Grav) || place_meeting(x,y,prtMovingPlatformJumpthrough)) || !_PlatformCheck)) || spike
                )*/
        
            )
        {
            shift = !spike;
            
            //move megaman into spikes to kill him
            if (spike && _Object == objMegaman)
            {
                if (objMegaman.canHit && global.playerHealth[player_id])
                {
                    shift = true;
                }
            }
            
            if (shift)
            {
                y += _Y;
            }
        }
        else // this next line moves the object until it can't anymore
        {
            while (place_meeting(x,y+_Y,objSolid) && place_meeting(x,y+_Y,prtMovingPlatformSolid)
            && ((place_meeting(x,y+_Y,objTopSolid) && sign(_Y) == _Grav) && !place_meeting(x,y,objTopSolid) && _PlatformCheck)
            && ((place_meeting(x,y+_Y,prtMovingPlatformJumpthrough) && sign(_Y) == _Grav) && !place_meeting(x,y,prtMovingPlatformJumpthrough) && _PlatformCheck))
            
            && (!place_meeting(x,y+sign(_Y),objSolid) && !place_meeting(x,y+sign(_Y),prtMovingPlatformSolid)
            && ((place_meeting(x,y+sign(_Y),objTopSolid) && sign(_Y) == _Grav) && !place_meeting(x,y,objTopSolid) && _PlatformCheck)
            && ((place_meeting(x,y+sign(_Y),prtMovingPlatformJumpthrough) == _Grav) && !place_meeting(x,y,prtMovingPlatformJumpthrough) && _PlatformCheck))
            {
                y += sign(_Y);
            }
        }
    }
}
