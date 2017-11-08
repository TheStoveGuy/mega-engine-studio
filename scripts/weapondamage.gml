//stores the weapon damage values

switch (object_index)
{     
    //Weak to Blade
    case objBigEye:
    case objMM2Mech:
    case objBikky:
    case objJumbig:
    case objGachappon:
    case objPowerMuscler:
    case objYudon:
    case objPowerSlam:
    case objDachone:
    case objDachoneLtdEd:
    case objGorillaTank:
    case objBenK:
        wpndmg[0] = 1; //Mega Buster
        wpndmg[1] = 1; //Mega Buster Charge1
        wpndmg[2] = 3; //Mega Buster Charge2
        wpndmg[3] = 1; //Weapon Explosion
        wpndmg[4] = 1; //HornetChaser
        wpndmg[5] = 1; //JewelSatellite
        wpndmg[6] = 1; //GrabBuster
        wpndmg[7] = 3; //TripleBlade
        wpndmg[8] = 2; //WheelCutter
        wpndmg[9] = 1; //SlashClaw
        wpndmg[10] = 4; //Sakugarne
        wpndmg[11] = 2; //SuperArrow
        wpndmg[12] = 1; //WireAdapter
        break;
    
    //Weak to Slash
    case objMM1SniperJoe:
    case objMM2SniperJoe:
    case objJunkGolem:
    case objKomasaburo:
    case objHammerJoe:
    case objSkeletonJoe:
    case objMM4ShieldAttacker:
    case objCrystalJoe:
    case objApacheJoe:
    case objTatepakkan:
    case objNewShieldAttacker:
    case objShieldAttackerGTR:
    case objCannonJoe:
    case objPiripareeJoe:
    case objPierrobug:
    case objMumaria:
        wpndmg[0] = 1; //Mega Buster
        wpndmg[1] = 1; //Mega Buster Charge1
        wpndmg[2] = 3; //Mega Buster Charge2
        wpndmg[3] = 1; //Weapon Explosion
        wpndmg[4] = 1; //HornetChaser
        wpndmg[5] = 1; //JewelSatellite
        wpndmg[6] = 1; //GrabBuster
        wpndmg[7] = 1; //TripleBlade
        wpndmg[8] = 1.5; //WheelCutter
        wpndmg[9] = 4; //SlashClaw
        wpndmg[10] = 4; //Sakugarne
        wpndmg[11] = 2; //SuperArrow
        wpndmg[12] = 1; //WireAdapter
        break;
    
    //Weak to Wheel
    case objCroaker:
    case objCuttingWheel:
    case objCuttingWheelStationary:
    case objCuttingWheelChase:
    case objRoboRabbit:
    case objBomberPepe:
    case objNewShotman:
    case objSkullmet:
    case objSuperBallMachineJr:
    case objMonoRoader:
    case objPakatto24:
    case objTwinCannon:
    case objFoojeen:
    case objCocco:
    case objCorocoro:
    case objBombThrown:
    case objShigaraky:
    case objBatabattan:
    case objMechakkero:
    case objSubeil:
    case objTatebo:
    case objFireBoy:
    case objYaffu:
    case objWallBlaster2:
    case objFatool:
        wpndmg[0] = 1; //Mega Buster
        wpndmg[1] = 1; //Mega Buster Charge1
        wpndmg[2] = 3; //Mega Buster Charge2
        wpndmg[3] = 1; //Weapon Explosion
        wpndmg[4] = 2; //HornetChaser
        wpndmg[5] = 1; //JewelSatellite
        wpndmg[6] = 1; //GrabBuster
        wpndmg[7] = 1; //TripleBlade
        wpndmg[8] = 3; //WheelCutter
        wpndmg[9] = 1; //SlashClaw
        wpndmg[10] = 4; //Sakugarne
        wpndmg[11] = 2; //SuperArrow
        wpndmg[12] = 1; //WireAdapter
        break;
        
    //Weak to Grab
    case objFanFiend:
    case objCrazyRazy:
    case objLightningLord:
    case objMonking:
    case objHariHari:
    case objGyoraboi:
    case objPickelmanBull:
    case objRackaser:
    case objTomBoy:
    case objSasoreenu:
    case objTotemPolen:
    case objBounder:
    case objRockThrown:
    case objMetallCannon:
    case objNobita:
    case objNobitaCieling:
    case objAuAu:
    case objPandeeta:
    case objSkullWalker:
    case objCannopeller:
    case objPetitDevilGreen:
    case objPetitDevilYellow:
    case objSquidon:
        wpndmg[0] = 1; //Mega Buster
        wpndmg[1] = 1; //Mega Buster Charge1
        wpndmg[2] = 3; //Mega Buster Charge2
        wpndmg[3] = 1; //Weapon Explosion
        wpndmg[4] = 1; //HornetChaser
        wpndmg[5] = 1; //JewelSatellite
        wpndmg[6] = 3; //GrabBuster
        wpndmg[7] = 1; //TripleBlade
        wpndmg[8] = 1; //WheelCutter
        wpndmg[9] = 1; //SlashClaw
        wpndmg[10] = 4; //Sakugarne
        wpndmg[11] = 2; //SuperArrow
        wpndmg[12] = 1; //WireAdapter
        break;
        
    //Default Damage Table
    default:
        wpndmg[0] = 1; //Mega Buster
        wpndmg[1] = 1; //Mega Buster Charge1
        wpndmg[2] = 3; //Mega Buster Charge2
        wpndmg[3] = 1; //Weapon Explosion
        wpndmg[4] = 2; //HornetChaser
        wpndmg[5] = 1; //JewelSatellite
        wpndmg[6] = 1; //GrabBuster
        wpndmg[7] = 1; //TripleBlade
        wpndmg[8] = 2; //WheelCutter
        wpndmg[9] = 1; //SlashClaw
        wpndmg[10] = 4; //Sakugarne
        wpndmg[11] = 2; //SuperArrow
        wpndmg[12] = 1; //WireAdapter
        break;
}

if global.chargeUpgrade
{
    if object_get_parent(object_index) != prtBoss and object_get_parent(object_index) != prtFortressBoss
    {
        wpndmg[1] += 1;
        wpndmg[2] += 1;
    }
}
