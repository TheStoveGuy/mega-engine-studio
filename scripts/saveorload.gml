//saveorload("load",0);
//argument 0 - loading or saving
//argument 1 - which save file (0 = main save file)

with objGlobalControl
{
saveload = argument0;
var fname;
fname = argument1;

savelist = ds_list_create();

if saveload = "save" //Save data
{
    show_debug_message("saving game")
    if !fname //Main save file data
    {
        save(0,global.screensize);
        save(0,global.musicvolume);
        save(0,global.soundvolume);
        save(0,global.damagepopup);
        save(0,global.mmColor);
        save(0,global.chargeBar);
        save(0,global.showFPS);
        save(0,global.showControllerOverlay);
        save(0,global.playerCount)
        
        for (var i=0; i<4; i+=1;)
        {
            save(0,global.leftKey[i])
            save(0,global.rightKey[i])
            save(0,global.upKey[i])
            save(0,global.downKey[i])
            save(0,global.jumpKey[i])
            save(0,global.slideKey[i])
            save(0,global.shootKey[i])
            save(0,global.pauseKey[i])
            save(0,global.weaponSwitchRightKey[i])
            save(0,global.weaponSwitchLeftKey[i])
            
            save(0,global.joystick_jumpKey[i]);
            save(0,global.joystick_shootKey[i]);
            save(0,global.joystick_slideKey[i]);
            save(0,global.joystick_pauseKey[i]);
            save(0,global.joystick_weaponSwitchLeftKey[i]);
            save(0,global.joystick_weaponSwitchRightKey[i]);
        }
    }
    else
    {
        save(0,global.bolts);
        save(0,global.eTanks);
        save(0,global.mTanks);
        save(0,global.energyElements);
        save(0,global.chargeUpgrade);
        save(0,global.shotUpgrade);
        save(0,global.dropUpgrade);
        save(0,global.skullAmulet);
        save(0,global.sturdyHelmet);
        save(0,global.converter);
        save(0,global.energySaver);
        
        save(0,global.castlestagesbeaten);
        save(0,global.seconds);
        
        for (i=0;i<array_length_1d(global.lvlLevel);i+=1)
        {
            for (z=1; z<=global.energyElementTotal[global.lvlLevel[i]]; z+=1)
            {
                save(0,global.energyElement[z,global.lvlLevel[i]]);
            }
        }
    }

    save(1,fname); //Write the data onto the save file
}
if saveload = "load" //Load a save
{
        show_debug_message("loading game...")
    if !save(1,fname) {ds_list_destroy(savelist); return(0);} //Get the data from the save file
    
    if !fname //Main save file data
    {
        global.screensize = save(0,0);
        global.musicvolume = save(0,0);
        global.soundvolume = save(0,0);
        global.damagepopup = save(0,0);
        global.mmColor = save(0,0);
        global.chargeBar = save(0,0);
        global.showFPS = save(0,0);
        global.showControllerOverlay = save(0,0);
        global.playerCount = save(0,0);
        
        for (var i=0; i<4; i+=1;)
        {
            global.leftKey[i] = save(0,0)
            global.rightKey[i] = save(0,0)
            global.upKey[i] = save(0,0)
            global.downKey[i] = save(0,0)
            global.jumpKey[i] = save(0,0)
            global.slideKey[i] = save(0,0)
            global.shootKey[i] = save(0,0)
            global.pauseKey[i] = save(0,0)
            global.weaponSwitchRightKey[i] = save(0,0)
            global.weaponSwitchLeftKey[i] = save(0,0)

            global.joystick_jumpKey[i] = save(0,0);
            global.joystick_shootKey[i] = save(0,0);
            global.joystick_slideKey[i] = save(0,0);
            global.joystick_pauseKey[i] = save(0,0);
            global.joystick_weaponSwitchLeftKey[i] = save(0,0);
            global.joystick_weaponSwitchRightKey[i] = save(0,0);
        }
    }
    else
    {
        global.bolts = save(0,0);
        global.eTanks = save(0,0);
        global.mTanks = save(0,0);
        global.energyElements = save(0,0);
        global.chargeUpgrade = save(0,0);
        global.shotUpgrade = save(0,0);
        global.dropUpgrade = save(0,0);
        global.skullAmulet = save(0,0);
        global.sturdyHelmet = save(0,0);
        global.converter = save(0,0);
        global.energySaver = save(0,0);
        global.castlestagesbeaten = save(0,0);
        global.seconds = save(0,0);
        
        for (i=0;i<array_length_1d(global.lvlLevel);i+=1)
        {
            for (z=1; z<=global.energyElementTotal[global.lvlLevel[i]]; z+=1)
            {
                global.energyElement[z,global.lvlLevel[i]] = save(0,0);
            }
        }
    }
}

ds_list_destroy(savelist);
return(1);
}
