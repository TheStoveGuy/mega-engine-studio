///activateImportantObjects()
//Activates important objects. Usually call this after doing instance_deactivate_all(true);

//Add more important objects as they are added
instance_activate_object(objMegaman);
instance_activate_object(objGlobalControl);
instance_activate_object(objHealthWeaponBar);

//Objects that should remain activated, but without animation (disabled animation code is in the object itself)
instance_activate_object(prtAlwaysActive);
instance_activate_object(objFadeout);
instance_activate_object(objSakugarne);
instance_activate_object(objSectionBorderHorizontal);
instance_activate_object(objSectionBorderVertical);

//Objects that destroy themselves off screen
//Though, when switching sections they should not be visible
if !global.switchingSections
{
    instance_activate_object(prtPlayerProjectile);
    instance_activate_object(prtEnemyProjectile);
    //instance_activate_object(prtEffect);
    //instance_activate_object(objBossControl);
}
else //Objects that should be visible during a screen transition
{
    instance_activate_object(objWaterJet);
    instance_activate_object(objBossDoor);
    instance_activate_object(objBalladeMissile);
    instance_activate_object(objRockPlatform);
    instance_activate_object(objBlockTrain);
    instance_activate_object(objFallingPlatform);
    instance_activate_object(objLever);
    instance_activate_object(objJunkBlock);
    instance_activate_object(objSnakeBody);
    instance_activate_object(objLiftRail);
    instance_activate_object(objMagnetMachine);
    instance_activate_object(objLineVertical);
    instance_activate_object(objChillManBlock);
    instance_activate_object(objSheepBlockB);
    instance_activate_object(objQuickSand);
    instance_activate_object(objCompactor);
    instance_activate_object(objSplashWomanWaterPlatform);
    instance_activate_object(objWaveStream);
    instance_activate_object(objDustmanBlock);
    instance_activate_object(objGravityChangeNormal);
    instance_activate_object(objGravityChangeLow);
    instance_activate_object(objGravityChangeHigh);
    instance_activate_object(objOil);
    instance_activate_object(objWanaan);
    instance_activate_object(objMM2Conveyor);
    instance_activate_object(objFanUp);
    instance_activate_object(objSpring);
    instance_activate_object(objBouncyTile);
    instance_activate_object(objElecBlock);
    instance_activate_object(objFireBlock);
    instance_activate_object(objTileScrollBG);
    instance_activate_object(objTileScrollSolid);
    instance_activate_object(objLeverfield);
    instance_activate_object(objRollingDrillField);
    instance_activate_object(objLeverField_lagless);
    instance_activate_object(objMM6Conveyor);
}

//quack you lazy cat
/*if room != lvlSheriffMan_cruiseElroy
{
    instance_activate_object(objParallax_cruiseElroy);
}*/
