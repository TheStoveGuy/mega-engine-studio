///playMusic()
//Stops the music

FMODAllStop();

if global.msc != -1
{
    FMODSoundFree(global.msc);
}

global.msc = -1;
global.mscPlay = -1;
global.mscName = '';
