///popBossDoors
//creates all boss doors at once so that they can agglutinate

instance_activate_object(objSectionVerticalScrolling);
instance_activate_object(objSectionPit);
for (i = 0; i < boss_door_n; i+= 1) {
    boss_door[i] = instance_create(boss_door_x[i],boss_door_y[i],boss_door_type[i]);
    /*boss_door_begin_event_door[boss_door_begin_event_n] = boss_door[i];
    boss_door_begin_event_timer[boss_door_begin_event_n] = 2;
    boss_door_begin_event_n += 1;*/
}
for (i = 0; i < boss_door_n; i+= 1) {
    with boss_door[i] {
        event_user(3)
        alarm[0] = -1;
        var v; v=0;
        //If x- and y-scale is same
        if image_xscale == image_yscale {
            v = place_meeting(x,y,objSectionVerticalScrolling);
        }
        //If vertical
        if (image_xscale > image_yscale) or v {
            type = 'v';
            height = image_xscale;
            doorHeight = image_xscale;
            mid = bbox_top+(bbox_bottom-bbox_top)*0.5;
        }
        //If horizontal
        else if (image_xscale < image_yscale) or !v {
            type = 'h';
            height = image_yscale;
            doorHeight = image_yscale;
            mid = bbox_left+(bbox_right-bbox_left)*0.5;
        }
        visible = false;
        isTile = true;
        
        visible = false;
        isTile = true;
        
        //Tile split check
        for(i=0;i<image_xscale;i+=1;) { // X
            for(j=0;j<image_yscale;j+=1;) // Y
            {
            d = 1000000; //Tile layer
            if tile_layer_find(d,x+i*16,y+j*16)
                {
                var tile, tileX, tileY;
                tile = tile_layer_find(d,x+i*16,y+j*16)
                if tile_get_width(tile) > 16
                    or tile_get_height(tile) > 16
                    {
                    for(tileX=0;tileX<round(tile_get_width(tile)/16);tileX+=1;)
                    for(tileY=0;tileY<round(tile_get_height(tile)/16);tileY+=1;)
                        tile_add(tile_get_background(tile),tile_get_left(tile)+tileX*16,tile_get_top(tile)+tileY*16,16,16,tile_get_x(tile)+tileX*16,tile_get_y(tile)+tileY*16,d);
                    tile_delete(tile);
                    }
                }
            }
        }
        event_perform(ev_alarm,0)
        if type == 'v'
            dir = 0
    }
}

boss_door_n = 0;
