///playerFreeMovement()
//Frees the player's movement (e.g. after being locked)

with objMegaman
{
    if !instance_exists(objWireAdapter)
    {
        canGravity = true;
        canMove = true;
    }
    canPause = true;
    mask_index = mskMegaman;
    global.timeStopped = false;
}
