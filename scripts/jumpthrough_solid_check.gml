/// helper script for solid_at

var dx, src_pos_y, dst_pos_y, gvec, type;

dx = argument[0]
src_pos_y = argument[1];
dst_pos_y = argument[2];
gvec = argument[3];
type = argument[4];

with type {
    my_pos_y = bbox_bottom;
    if gvec > 0
        my_pos_y = bbox_top;
    if place_meeting(x - dx,y + src_pos_y - dst_pos_y,other) {
        if my_pos_y == median(my_pos_y,src_pos_y,dst_pos_y)
            return true;
    }
}

return false;
