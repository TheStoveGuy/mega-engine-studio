//Pick nearest mega man target:
targetobj = objMegaman;
target = instance_nearest(x, y, targetobj);
/*if !target
{
    target = targetobj;
}*/

//Accumulated information, gathered from step event.
accShotTimer = 1000;
accTimer = 0;
pickTarget = 1;

//The strategy the enemy should use to pick which player is 'the player'
behaviourType = 0;
