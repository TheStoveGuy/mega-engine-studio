//savefilvalues()

global.eTanks = 0;
global.mTanks = 0;
global._lives = 2;
global.bolts = 0;

global.energyElements = 0;

global.chargeUpgrade = false;
global.shotUpgrade = false;
global.dropUpgrade = false;
global.skullAmulet = false;
global.sturdyHelmet = false;
global.converter = false;
global.energySaver = false;

global.castlestagesbeaten = 0;
global.playerSprite[0] = sprRockman;
global.playerSprite[1] = sprProtoman;
global.playerSprite[2] = sprRoll;
global.playerSprite[3] = sprBass;
global.seconds = 0;

global.energyElementTotal[0] = 0;

//defaults
for (i=0;i<array_length_1d(global.lvlLevel);i+=1)
{ 
    global.energyElementTotal[global.lvlLevel[i]] = 1;
}

//exceptions

//apply all settings
for (i=0;i<array_length_1d(global.lvlLevel);i+=1)
{
    //Elements
    global.energyElementTotal[0] += global.energyElementTotal[global.lvlLevel[i]];
    for (z=1; z<=global.energyElementTotal[global.lvlLevel[i]]; z+=1)
    {
        global.energyElement[z,global.lvlLevel[i]] = false;
        
    }
}
