///playerGetHit(health)
//Call it like this: with objMegaman playerGetHit();
//Makes the player get hit

var dmg,ndmg;
dmg = argument0;

if canHit && dmg > 0
{
    if global.skullAmulet
    {
        if !(global.playerHealth[player_id] - dmg) && global.playerHealth[player_id] > 1
        {
            dmg = global.playerHealth[player_id]-1;
            playSFX(sfxMenuSelect);
        }
    }
    global.playerHealth[player_id] -= dmg;
    
    canHit = false;
    isHit = true;
    hitTimer = 0;
    isStep = false;
    climbing = false;
    canGravity = true;
    isShoot = 0;
    shootStandstill = false;
    onRushJet = false;
    shootTimer = 0;
    global.timeStopped = false;
    
    //When sliding and there's a solid above us, we should not experience knockback
    //If we did, we would clip inside the ceiling above us
    if !(isSlide && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)))
    {
        canMove = false;
        isSlide = false;
        mask_index = mskMegaman;
        
        xspeed = image_xscale * -0.5;
        if yspeed*global.GravityDir <=0
        {
            yspeed = -1.5*global.GravityDir;
        }
        else {yspeed = 0;}
        
        if global.playerHealth[player_id] > 0
        {
            //Create sweat effects
            instance_create(sprite_get_xcenter()-11,sprite_get_ycenter()-17, objMegamanSweat);
            instance_create(sprite_get_xcenter(),   sprite_get_ycenter()-17, objMegamanSweat);
            instance_create(sprite_get_xcenter()+11,sprite_get_ycenter()-17, objMegamanSweat);
        }
    }
    
    if global.playerHealth[player_id] > 0 {
        playSFX(sfxHit);
    }
    
    if global.damagepopup //Damagepopup
    {
        ndmg = instance_create(bbox_get_xcenter(),bbox_top-1,objDamagePopup);
        ndmg.damage = dmg;
        ndmg.depth = depth-1;
    }
    
    if other.id != id
    {
        with other {event_user(14);}
    }
}
