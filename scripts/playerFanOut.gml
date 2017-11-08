/// playerFanOut(dist[, maxdist])
// causes the players to fan out, even if locked.
// "dist" is the minimum spacing desired between players (negative: fan out to left)
// "maxdist" is the maximum total distance between any two players;
// spacing will compress to satisfy this constraint if necessary.
// call like so: with objMegaman playerFanOut(16*image_xscale,64)
// requires canMove to be false

if canMove or global.playerCount = 1
{
    exit;
}
    
var dist = argument0;
if argument_count > 0 //Keep seperation within the limit
{
    dist = min(abs(dist),argument1/instance_number(objMegaman))*sign(dist);
}

//Set fan-out distance
fanoutDistance = max(player_id,instance_number(objMegaman))*dist;
