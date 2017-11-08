//setTargetHit(projectile id)

var projectile = argument0;

switch (behaviourType)
{
    case 0:
    case 2:
        //Consider targetting aggressor
        //Don't target new aggressor if very near an existing mega man, unless aggressor is also near:
        var change = false;
        if instance_exists(target)
        {
            if distance_to_object(target) < 32
            {
                if instance_exists(projectile.parent)
                {
                    if distance_to_object(projectile.parent) < 40
                    {
                        change = true;
                    }
                }
            }
        }
        if change && accShotTimer > 120 //Target aggressor, but only if it hasn't been too long since the last switch
        {
            accShotTimer = 0;
            target = projectile.parent;
        }
        break;
    case 1: //Target agressor
        accShotTimer = 0;
        target = projectile.parent;
    case 3:
        //Sorry - Nothing
        break;
}
