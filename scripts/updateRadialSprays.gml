///updateRadialSpray()
for (var i = 0; i < radialArrayCount; i += 1) { 
    var map = radialArray[i];
    var timePerBullet = map[? "timePerBullet"]
    var dAngle = map[? "dAngle"];
    var prevTime = map[? "prevTime"];
    var numBullets = map[? "numBullets"];
    var bulletSpeed = map[? "bulletSpeed"];
    var bulletType = map[? "bulletType"];
    var currentAngle = map[? "currentAngle"];
    var pauseTime = map[? "pauseTime"];
    var pauseTimeFinished = map[? "pauseTimeFinished"];
    
    var currentTime = current_time;
    var dTime = currentTime - prevTime;
    
    if (!pauseTimeFinished && (dTime >= pauseTime) ) {
        
        prevTime = currentTime - (dTime - pauseTime);
        map[? "prevTime"] = prevTime;
        
        map[? "pauseTimeFinished"] = true;
    } 
    
    if (pauseTimeFinished) {
        if (numBullets > 0) { //While you still have bullets to shoot...
            
            //Check if it is the time to shoot.
            if (dTime >= timePerBullet) {
            
                //Create bullet
                var bullet = instance_create(x,y, bulletType);
                bullet.sfxEnabled = true;
                bullet.direction = currentAngle;
                bullet.image_angle = currentAngle;
                bullet.speed = bulletSpeed;
                //bullet.image_xscale = 0.3;
                //bullet.image_yscale = 0.3;
                
                if ((dTime - timePerBullet) >= 0.25 * timePerBullet) {
                    prevTime = prevTime + dTime; 
                } else {
                    prevTime = prevTime + timePerBullet; 
                }
                currentAngle += dAngle //Increment angle for next shot.
                numBullets -= 1;
                
                map[? "currentAngle"] = currentAngle;
                map[? "prevTime"] = prevTime;
                map[? "numBullets"] = numBullets;
            }
        } else {
            //Destroy the map and update the radialArray
            ds_map_destroy(radialArray[i]);
            for (var j = i;  j < radialArrayCount - 1; j += 1) {
                //Shift remaining maps
                radialArray[j] = radialArray[j+1];
                
                  
            }
            //De-increment i;
            i -= 1; 
            
            //Subtract 1 from the count
            radialArrayCount = radialArrayCount - 1;
            show_debug_message("Radial Array Count: " + string(radialArrayCount));
        }
    }
}
