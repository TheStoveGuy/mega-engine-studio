/// placeObjectsInSection(sectionLeft,sectionTop,sectionRight,sectionBottom)
/// places collision objects in a section; called from playerCameraInit

if complete
    // setting is already done; no need to place any tiles at all.
    exit;
    
var sectionLeft,sectionRight,sectionTop,sectionBottom;
sectionLeft = max(0,floor(argument0/w - 1));
sectionTop = max(0,floor(argument1/h - 1));
sectionRight = min(room_max_rx,ceil(argument2/w + 1));
sectionBottom = min(room_max_rx,ceil(argument3/h + 1));

for (rx_ = sectionLeft;rx_ <= sectionRight;rx_ +=1) {
    for (ry_ = sectionTop;ry_ <= sectionBottom;ry_ +=1) {
        error_code = checkTile(rx_*w+1,ry_*h+1);
    }
}

popBossDoors();
with objMegaman
    playerDeactivateObjects();
