/// getRoomID(room)
// returns ID associated with given room, or -1 if not in list.

for (i=0; i<array_length_1d(global.lvlLevel); i+=1)
{
    if global.lvlLevel[i] == argument0
    {
        return i;
    }
}
return -1;
