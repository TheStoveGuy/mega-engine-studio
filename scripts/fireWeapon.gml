/*
fireWeapon(18,0,objBusterShot,3,0,1,0);

argument0 = x value
argument1 = y value
argument2 = the object to fire
argument3 = bullet limit
argument4 = energycost
argument5 = shoot, throw, etc. (0 = no shoot frame)
argument6 = stop movement
*/

var xs,ys,wobj,limit,cost,frame,_canwalk;
xs = argument0;
ys = argument1;
wobj = argument2;
limit = argument3;
cost = argument4;
frame = argument5;
stopit = argument6;

//Checks bullet limit
if bullets >= limit && limit > 0
{
    return(-1);
    exit;
}

//Checks if enough weapon energy
if cost > 0
{
    var current = global.weapon[player_id];
    if global.ammo[player_id,current] <= 0 {return(-1); exit;}
    global.ammo[player_id,current] = max(0,global.ammo[player_id,current] - cost/(global.energySaver+1));
}

//Turn Around
if canturn && hdir != 0
{
    image_xscale = hdir;
}

//Shoot or throw
shootTimer = 0;
isShoot = frame;
shootStandstill = stopit;

if !ground and (isShoot < 3) {xs -= 5;}

//Bullet position
xx = 0;
yy = 4;
if climbing 
{
    image_xscale = climbShootXscale;
    yy = 2;
}
else if !ground
{
    yy = -1;
}

if inWaveBike
{
    yy = 9;
}

//Spawn the bullet
i = instance_create(x+(xs+xx)*image_xscale,y+(ys+yy)*image_yscale,wobj);

if (instance_exists(i))
{
    i.parent = id;
    i.image_xscale = image_xscale;
    with i {event_user(15);}
    
    return(i);
}
