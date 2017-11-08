switch (behaviourType)
{
    case 0: //Generic 'smart' / non-obvious AI
        
        //Previoust target died,
        if !instance_exists(target)
        {
            pickTarget = 1;
        }
        var dist, closest;
        
        //If mega man is very far, and hasn't shot lately, retarget with very low probability
        if instance_exists(target) && !irandom(500) && accShotTimer > 100
        {
            dist = point_distance(x,y,target.x,target.y)
            if dist > 80
            {
                pickTarget = 1;
            }
        }
            
        //Select nearest
        if instance_exists(targetobj) && pickTarget
        {
            closest = noone
            dist = 10000;
            with targetobj
            {
                var pick;
                pick = point_distance(x,y,other.x,other.y) < dist - 10 || (point_distance(x,y,other.x,other.y) < dist && random(1)<0.5);
                if pick
                {
                    closest = id;
                    dist = point_distance(x,y,other.x,other.y);
                }
            }
            target = closest;
            pickTarget = 0;
        }
        
        //switch if another player comes much closer:
        if instance_exists(target)
        {
            dist = point_distance(x,y,target.x,target.y)
            with targetobj
            {
                if point_distance(x,y,other.x,other.y) <  dist/3
                {
                    other.target = id
                }
            }
        }
        break;
    case 1: //Pick nearest player at every step
        if instance_exists(targetobj)
        {
            target = instance_nearest(x,y,targetobj);
        }
        else
        {
            target = noone;
        }
        break;
    case 2: //Switch players every couple seconds
        if instance_exists(targetobj)
        {
            if (accTimer mod 140 == 90 && instance_exists(target))
            or !instance_exists(target)
            {
                target = instance_find(targetobj,instance_number(targetobj)-1);
            }
        }
        break;
    case 3: //Do nothing
        break;
    case 4: //Pick once, never switch
        if !instance_exists(target) && instance_exists(targetobj)
        {
            target = instance_find(targetobj,instance_number(targetobj)-1);
        }
        break;
} 

accTimer += 1;
accShotTimer += 1;
