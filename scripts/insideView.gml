///insideView()
//Returns true if the object is inside the view, and false if not
//This script only works for view 0

//if sprite_get_xcenter() >= view_xview[0] && sprite_get_xcenter() <= view_xview[0]+view_wview[0]
//&& sprite_get_ycenter() >= view_yview[0] && sprite_get_ycenter() <= view_yview[0]+view_hview[0] {
if bbox_right >= view_xview[0] && bbox_left <= view_xview[0]+view_wview[0]
&& bbox_bottom >= view_yview[0] && bbox_top <= view_yview[0]+view_hview[0] {
    return true;
}
else {
    return false;
}
