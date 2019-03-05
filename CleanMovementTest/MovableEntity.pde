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
  boolean moving; // Currently unused.
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
    float yInvEntry;
    float yInvExit;
    
    if(entitySpeed.y > 0) {
       yInvEntry = platform.yPosition - (entityLocation.y + entityDimensions.y); // Distance
       yInvExit = (platform.yPosition + platform.thickness) - entityLocation.y;
    } else {
      yInvEntry = entitySpeed.y;
      yInvExit = entitySpeed.y;
    }
    
    float yEntry; // Time in frames to enter
    float yExit;
    
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
  
  public boolean checkPlatformCollision(Platform specificPlatform){
    boolean inXArea = entityLocation.x < specificPlatform.xRight && entityLocation.x + entityDimensions.x> specificPlatform.xLeft; 
    if(specificPlatform.droppable) {
      if((inXArea && !dropping)) {
        float collisiontime = platformCollisionTime(specificPlatform);
        entitySpeed.y *= collisiontime;
        if(collisiontime == 0) {
          return true;
        }
      } else {
        return false;
      }
    } else {
      if(inXArea){
        float collisiontime = platformCollisionTime(specificPlatform);
        entitySpeed.y *= collisiontime;
        if(collisiontime == 0){
          return true;
        }
      } else {
        return false;
      }
    }
    return false;
  }
  
  // Uses sweptAABB
  public void checkAllPlatformCollision(ArrayList<Platform> platforms){
    boolean touchPlatform = false;
    for(Platform platform: platforms){
      if(checkPlatformCollision(platform)){
        touchPlatform = true;
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
  
  public void checkWalls(){
    if(entityDimensions.x > width + 100 || entityDimensions.x < -100){
      entityDimensions = new PVector(100,250);
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
      entitySpeed.x+= accelerationRate;
    }else if(entitySpeed.x > 0){
      entitySpeed.x-= accelerationRate;
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