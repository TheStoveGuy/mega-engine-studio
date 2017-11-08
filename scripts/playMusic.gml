///playMusic(filename, loop, volume)
//Plays music with a set volume. Volume should be between 0 and 1.
//We're using the FMOD sound system, which means all music must be stored externally
//Preferably, use the .ogg format, since this takes much less disk space than .mp3 or .wav

//Example: playMusicNoLoopVolume("CutMan.ogg", 1, 0.6)

var mus;
var arg0 = argument0

mus = 'Music\'+arg0

if global.mscName = mus {exit;}
else {stopMusic();}

if !file_exists(mus) {exit;}

//Load
global.msc = FMODSoundAdd(mus, false, true);

if argument1 //Loop
{
    global.mscPlay = FMODSoundLoop(global.msc, false);
}
else //Play
{
    global.mscPlay = FMODSoundPlay(global.msc, false);
}
//Volume
FMODInstanceSetVolume(global.mscPlay, argument2*(global.musicvolume*0.01));

global.mscName = mus;
