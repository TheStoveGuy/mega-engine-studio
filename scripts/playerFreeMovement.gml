///playerFreeMovement()
//Frees the player's movement (e.g. after being locked)

with objMegaman
{
    canMove = true;
    canStep = true;
    canHit = true;
    canPause = true;
    canSpriteChange = true;
    mask_index = mskMegaman;
}
