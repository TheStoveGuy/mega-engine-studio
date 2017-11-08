///playerDraw()

if teleporting or showReady
{
    if instance_exists(objFadeIn) {exit;}
}

if teleporting && !instance_exists(objSectionSwitcher)
{
    canSpriteChange = 1;
    playerHandleSprites("Teleport");
    canSpriteChange = 0;
    if !global.frozen
    {
        if round(y) >= landy
        {
            if teleportTimer == 0
            {
                playSFX(sfxTeleportIn);
                y = landy;
                teleportImg = 0;
            }
            if teleportTimer == 3
            {
                teleportImg = 1;
            }
            else if teleportTimer == 6
            {
                teleportImg = 0;
            }
            else if teleportTimer == 9
            {
                teleportImg = 2;
            }
            else if teleportTimer = 13
            {
                teleporting = false;
                teleportTimer = 0;
                canSpriteChange = true;
                canMove = true;
                canHit = true;
                canGravity = true;
                canPause = true;
                ground = true;
                exit;
            }
            teleportTimer += 1;
        }
        else {y += 8;}
    }
}

if showReady
{
    //Draw the READY text
    if !global.frozen {readyTimer += 1;}
    
    var readyIndicator;
    readyIndicator = readyTimer mod 12;
    if readyIndicator >= 6 && readyIndicator <= 11 //For the last 7 frames of every 14 frames, show the READY text
    {
        ready_text = "READY";
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white)
        
        draw_text(view_xview+view_wview/2,view_yview+view_hview/2,ready_text)
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
    if readyTimer >= 72
    {
        readyTimer = 0;
        showReady = false;
        //Teleporting sequence
        teleporting = true;
        landy = y;
        y = view_yview-32;
        teleportTimer = 0;
    }
}
else
{
    //main drawing stuff
    col[0] = c_white;
    col[1] = global.primaryCol[player_id];
    col[2] = global.secondaryCol[player_id];
    col[3] = global.outlineCol[player_id];
    
    if drawHitspark //Hitspark
    {
        draw_sprite_ext(sprHitspark, 0, sprite_get_xcenter(), sprite_get_ycenter(), image_xscale, image_yscale, 0, c_white, 1);
    }
    else //Draws the player
    {
        SquareSize = 48;
        
        for (i=0; i<4; i+=1;) {
            draw_sprite_part_ext(
                global.playerSprite[player_id],i,
                1+(floor(spriteX)*(SquareSize+3)),
                1+(floor(spriteY)*(SquareSize+3)),
                SquareSize,SquareSize,
                round(x)-(24*image_xscale),
                round(y)-(20*image_yscale),
                image_xscale,image_yscale,
                col[i],image_alpha
            );
        }
    }
    
    //Weapon icon
    if drawWeaponIcon
    {
        var icon,iconx;
        iconx = 0;
        if !climbing {iconx = image_xscale;}
        col[0] = make_color_rgb(255,228,164);
        
        icon[1] = "";
        icon[2] = "Primary";
        icon[3] = "Secondary";
        
        for(i=1; i<=3; i+=1;)
        {
            draw_sprite_ext(asset_get_index("sprWeaponIcons"+icon[i]),global.weapon[player_id],round(x)-8+iconx,round(y)-30*image_yscale,1,image_yscale,0,col[i-1],image_alpha);
        }
    }
}

//draw_sprite_ext(sprDot,0,bbox_left,bbox_top,(bbox_right-bbox_left)+1,(bbox_bottom-bbox_top)+1,image_angle,c_white,0.66);
