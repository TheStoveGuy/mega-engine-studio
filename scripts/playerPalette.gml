/// playerPalette()
//Change colors depending on the special weapon

switch player_id
{
    case 0:
        if global.mmColor
        {
            rockprimaryCol = make_color_rgb(0,112,236);
            rocksecondaryCol = make_color_rgb(56,184,248);
        }
        else
        {
            rockprimaryCol = make_color_rgb(0,120,248);
            rocksecondaryCol = make_color_rgb(0,232,216);
        }
        break;
    case 1:
        rockprimaryCol = make_color_rgb(220,40,0);
        rocksecondaryCol = make_color_rgb(188,188,188);
        break;
    case 2:
        rockprimaryCol = make_color_rgb(248,56,0);
        rocksecondaryCol = make_color_rgb(0,168,0);
        break;
    case 3:
        rockprimaryCol = make_color_rgb(112,112,112);
        rocksecondaryCol = make_color_rgb(248,152,56);
        break;
}

switch global.weapon[player_id]
{
    case 0:
        global.primaryCol[player_id] = rockprimaryCol;
        global.secondaryCol[player_id] = rocksecondaryCol;
        break;
    case 1:
        global.primaryCol[player_id] = make_color_rgb(231, 191, 60);
        global.secondaryCol[player_id] = make_color_rgb(252, 252, 252);
        break;
    case 2:
        global.primaryCol[player_id] = make_color_rgb(67, 231, 216);
        global.secondaryCol[player_id] = make_color_rgb(252, 252, 252);
        break;
    case 3:
        global.primaryCol[player_id] = make_color_rgb(88, 216, 84);
        global.secondaryCol[player_id] = make_color_rgb(248, 184, 248);
        break;
    case 4:
        global.primaryCol[player_id] = make_color_rgb(184, 0, 184);
        global.secondaryCol[player_id] = make_color_rgb(252, 252, 252);
        break;
    case 5:
        global.primaryCol[player_id] = make_color_rgb(216, 0, 204);
        global.secondaryCol[player_id] = make_color_rgb(252, 252, 252);
        break;
    case 6:
        global.primaryCol[player_id] = make_color_rgb(72, 168, 16);
        global.secondaryCol[player_id] = make_color_rgb(232, 208, 32);
        break;
    case 7:
        global.primaryCol[player_id] = make_color_rgb(112, 112, 112);
        global.secondaryCol[player_id] = make_color_rgb(252, 252, 252);
        break;
    case 8:
        global.primaryCol[player_id] = make_color_rgb(216, 40, 0);
        global.secondaryCol[player_id] = make_color_rgb(255, 255, 255);
        break;
    // Utilities
    case 9:
        global.primaryCol[player_id] = make_color_rgb(216, 40, 0);
        global.secondaryCol[player_id] = make_color_rgb(255, 255, 255);
        break;
    case 10:
        global.primaryCol[player_id] = make_color_rgb(216, 40, 0);
        global.secondaryCol[player_id] = make_color_rgb(255, 255, 255);
        break;
    case 11:
        global.primaryCol[player_id] = make_color_rgb(216, 40, 0);
        global.secondaryCol[player_id] = make_color_rgb(255, 255, 255);
        break;
    case 12:
        global.primaryCol[player_id] = rockprimaryCol;
        global.secondaryCol[player_id] = rocksecondaryCol;
        break;
}

global.outlineCol[player_id] = c_black;

if isfrozen
{
    global.outlineCol[player_id] = make_color_rgb(0, 128, 136);
    global.primaryCol[player_id] = make_color_rgb(156, 248, 240);
    global.secondaryCol[player_id] = make_color_rgb(248, 248, 248);
}

if canStep
{
    if !global.keyPausePressed[player_id] //The pause menu also resets the colors as to not show charging colors in the Mega Man sprite at the bottom right
    {
        chargeTimer = 0;
        initChargeTimer = 0;
    }
}
