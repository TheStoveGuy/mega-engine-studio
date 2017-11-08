//setLevelMusic(music,song loop position in seconds, song length in seconds,  loops(true/false),volume)
// This script's meant to be used at the begining of a level so that way if a song stops, it can remember what song was playing before the song switched.

global.LevelSong = argument0;
global.SongLoopInSeconds = argument1;
global.SongInSeconds = argument2;
global.LevelLoop = argument3;
global.LevelVolume = argument4;
global.LevelLoopStart = global.SongLoopInSeconds/global.SongInSeconds;
global.LevelLoopEnd = 1;

playMusic(global.LevelSong,global.LevelLoop,global.LevelVolume);
if global.LevelLoop
{
    setMusicLoop(global.LevelLoopStart, global.LevelLoopEnd);
}
