///resumeShotgunSprays()
var currentTime = current_time;
for (var i = 0; i < shotgunArrayCount; i += 1) { 
    var map = shotgunArray[i];
    map[? "prevTime"] = currentTime - map[? "resumeOffset"];
    //map[? "resumeOffset"] = 0; 
}
