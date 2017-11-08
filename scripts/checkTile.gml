///checkTile(x,y)
//Called by objNiceSetter. Checks the tile at the given x,y pixel coordinate to see if it is in a nicetiler tileset and places it.
// returns 1 if there was no tile there, 0 if an object was placed, negative error code otherwise

pix_x = argument0;
pix_y = argument1;

pixfx = floor(pix_x/w)*w
pixfy = floor(pix_y/h)*h

tile = tile_layer_find(d,pix_x,pix_y);
if tile != -1 {
    tile_x = tile_get_x(tile) // tile's x position (in pixels)
    tile_y = tile_get_y(tile) // tile's y position (in pixels)
    tile_rx = floor(pix_x/w) // x position (in columns)
    tile_ry = floor(pix_y/h) // y position (in rows)
    
    // check that tile is within room boundaries:
    if tile_x < 0 || tile_y < 0
        return -1;
    if tile_x > room_width || tile_y > room_height
        return -2;
        
    // check that tile has not been placed already:
    if placed_object[tile_rx,tile_ry] > 0
        return -3;
    
    // check that tile is of the correct tileset:
    if tile_get_background(tile) != tileset
        return -4;
    
    // check that the tile is aligned
    if tile_get_left(tile) mod w || tile_get_top(tile) mod h || tile_x mod w || tile_y mod h
        return -5;
       
    // check that the tile's left and top coords are within the tile:
    if tile_get_left(tile) < 0 || tile_get_top(tile) < 0 || tile_get_left(tile) + tile_get_width(tile) > background_get_width(tileset) || tile_get_top(tile) + tile_get_height(tile) > background_get_height(tileset)
        return -7;
    
    // find out what type of object the tile should have placed on it:
    x_ = floor((tile_get_left(tile) + (pix_x - tile_x))/w);
    y_ = floor((tile_get_top(tile) + (pix_y - tile_y))/h);
    
    // check that tile is not the template tile
    if tile == template_tile
        return -9;
    
    object_type = template_object[x_,y_];
    if object_type != noone {
        // place object:
        if object_type == objBossDoor {
            // boss doors need special treatment because they complain if they do not agglutinate correctly
            boss_door_type[boss_door_n] = object_type;
            boss_door_x[boss_door_n] = pixfx;
            boss_door_y[boss_door_n] = pixfy;
            boss_door_n += 1;
            placed_object[tile_rx,tile_ry] = 1;
        }
        else {
            placed_object[tile_rx,tile_ry] = instance_create(pixfx,pixfy,object_type);
        }
    } else return -8
        
    return 0;
} else return 1;
