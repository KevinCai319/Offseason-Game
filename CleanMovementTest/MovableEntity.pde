public class MovableEntity{
    
  PVector entityLocation;
  PVector entityDimensions;
  PVector entitySpeed;
  float gravity; // Gravity speed
  float setSideSpeed;
  float setJumpForce;
  float accelerationRate;
  boolean inAir; // To see if entity is jumping
  boolean contactPlatform; // Used to determine if bottom of entity is on or below platform
  boolean dropping; // Used only for dropping through platforms. Set to true by key input.
  
  MovableEntity(PVector entityLocation, PVector entityDimensions, float gravity, float setSideSpeed, float setJumpForce, float accelerationRate){
    this.entityLocation = entityLocation;
    this.entityDimensions = entityDimensions;  
    entitySpeed = new PVector(0,0);
    this.gravity = gravity;
    this.setSideSpeed = setSideSpeed;
    this.setJumpForce = setJumpForce;
    this.accelerationRate = accelerationRate;
  }
  
  // Updates entity position and redraws visual position
  public void updateCEntity() {
    entityLocation.add(entitySpeed);
    rect(entityLocation.x, entityLocation.y, entityDimensions.x, entityDimensions.y); 
  }
  
  // Gravity acceleration by adding to speed instead of position. Adjustable.
  public void checkGravity() {
    if(!contactPlatform || inAir) entitySpeed.y += gravity;
  }
  
  public float platformCollisionTime(Platform platform){
    float yInvEntry, yInvExit;
    
    if(entitySpeed.y > 0) {
       yInvEntry = platform.yPosition - (entityLocation.y + entityDimensions.y); // Distance
       yInvExit = (platform.yPosition + platform.thickness) - entityLocation.y;
    } else {
      yInvEntry = entitySpeed.y;
      yInvExit = entitySpeed.y;
    }
    
    float yEntry, yExit;
    
    if(entitySpeed.y == 0) {
      yEntry = 1; // Don't calculate if not moving
      yExit = 1;
    } else {
      yEntry = yInvEntry/entitySpeed.y; // Time = distance/rate
      yExit = yInvExit/entitySpeed.y;
    }
    
    if(yEntry > yExit || yEntry < 0 || yEntry > 1) {// Don't calculate if the calculation is beyond a frame or entry face is beyond exit
      contactPlatform = false;
      return 1;
    } else {
      contactPlatform = true;
      return yEntry;
    }
  }
  
  // Uses sweptAABB
  public void checkAllPlatformCollision(ArrayList<Platform> platforms){
    boolean touchPlatform = false;
    
    for(Platform platform: platforms){
      boolean inXArea = entityLocation.x < platform.xRight && entityLocation.x + entityDimensions.x> platform.xLeft; 
      boolean isDrop = platform.droppable && dropping;
      float collisiontime = platformCollisionTime(platform);
      if(inXArea && !isDrop){
        entitySpeed.y *= collisiontime;
        if(collisiontime == 0) touchPlatform = true;
      }
    }
    
    if(touchPlatform){
      contactPlatform = true;
      inAir = false;
    }else{
      contactPlatform = false;
      inAir = true;
    }
  }
  
  public float wallCollisionTime(Wall wall){
    float xInvEntry, xInvExit;

    if(entitySpeed.x > 0) {
       xInvEntry = wall.xLeft - (entityLocation.x + entityDimensions.x); // Distance
       xInvExit = wall.xRight - entityLocation.x;
    } else if(entitySpeed.x < 0){
       xInvEntry = entityLocation.x - wall.xRight;
       xInvExit = (entityLocation.x + entityDimensions.x) - wall.xLeft;
    } else{
      xInvEntry = entitySpeed.x;
      xInvExit = entitySpeed.x;
    }
  
    float xEntry, xExit;
    
    if(entitySpeed.x == 0) {
      xEntry = 1; // Don't calculate if not moving
      xExit = 1;
    } else {
      xEntry = Math.abs(xInvEntry/entitySpeed.x); // Time = distance/rate
      xExit = Math.abs(xInvExit/entitySpeed.x);
    }

    if(xEntry > xExit || xEntry < 0 || xEntry > 1) {// Don't calculate if the calculation is beyond a frame or entry face is beyond exit
      contactPlatform = false;
      return 1;
    } else {
      contactPlatform = true;
      return xEntry;
    }

  }
  
  public void checkAllWallCollision(ArrayList<Wall> walls){
    for(Wall wall: walls){
      float collisiontime = wallCollisionTime(wall);
      entitySpeed.x *= collisiontime;
    }
  }  
  
  public void moveRight(){
    if(entitySpeed.x < setSideSpeed) entitySpeed.x+= accelerationRate;
  }
  
  public void moveLeft(){
    if(entitySpeed.x > -setSideSpeed) entitySpeed.x-= accelerationRate;
  }
  
  public void stopSideMove(){
    if(entitySpeed.x < 0){
      if(entitySpeed.x > -1){
        entitySpeed.x += 0 - entitySpeed.x;
      }else{
        entitySpeed.x += accelerationRate;
      }
    }else if(entitySpeed.x > 0){
      if(entitySpeed.x < 1){
        entitySpeed.x -= entitySpeed.x - 0;
      }else{
        entitySpeed.x -= accelerationRate;
      }
    }
  }
  
  public void jump(){
    entitySpeed.y = -setJumpForce;
    inAir = true;
  }
  
  public void drop(){
    dropping = true;
  }
  
  public void stopDrop(){
    dropping = false;
  }

}
