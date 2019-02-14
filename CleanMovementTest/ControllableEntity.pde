public class ControllableEntity {
  
  PVector entityLocation;
  PVector entityDimensions;
  PVector entitySpeed;
  float gravity; // Gravity speed
  boolean canJump; // If not jumping, entity can jump.  Slightly unnecessary and redundant but good for understanding code
  boolean jumping; // To see if entity is jumping
  boolean contactGround; // Used to determine if bottom of entity is on or below ground
  boolean contactPlatform; // Used to determine if bottom of entity is on or below platform
  boolean inXArea; // Used to determine if entity is within platform's x boundaries
  boolean abovePlatform; // Used to determine if entity is above platform
  boolean platformEnabled; // Used to enable the hitbox of the line if the entity was previously above it and within the x boundaries
  // boolean canMove; // Potential bool
  boolean moving;
  
  ControllableEntity(PVector entityLocation, PVector entityDimensions, float gravity){
    this.entityLocation = entityLocation;
    this.entityDimensions = entityDimensions;  
    entitySpeed = new PVector(0,0);
    this.gravity = gravity;
  }
  
  public void drawCEntity(){
    rect(entityLocation.x, entityLocation.y, entityDimensions.x, entityDimensions.y); 
    entityLocation.y += entitySpeed.y;
    entityLocation.x += entitySpeed.x;
    
    if(jumping){
      canJump = false;
    }else{
      canJump = true; 
    }
  }
  
  public void checkGravity(){
    if(!contactGround && !contactPlatform){
      entitySpeed.y += gravity;
    }
  }
  
  public void checkPlatformCollision(Platform specificPlatform){
    abovePlatform = entityLocation.y + entityDimensions.y < specificPlatform.yPosition;
    inXArea = entityLocation.x + entityDimensions.x > specificPlatform.xLeft && entityLocation.x < specificPlatform.xRight;
    
    if(abovePlatform && inXArea){
      platformEnabled = true;
    }
    if(platformEnabled){
      if(!abovePlatform){
        entityLocation.y = specificPlatform.yPosition - entityDimensions.y;
        
        contactPlatform = true;
        jumping = false;
        canJump = true;
        
        if(!inXArea){
          platformEnabled = false;
          contactPlatform = false;
          jumping = true;
          canJump = false;
        }
      }else{
        contactPlatform = false;
      }
    }
  }
  
  public void checkGroundCollision(Ground specificGround){
    contactGround = entityLocation.y + entityDimensions.y >= specificGround.yPosition;
    
    if(contactGround){
      entityLocation.y = specificGround.yPosition - entityDimensions.y;
      jumping = false;
      entitySpeed.y = 0;
    }
  }
  
  public void enableJump(){
    if(canJump){
      if(key == ' '){
        entitySpeed.y = -15;
        jumping = true;
      }
    }
  }
  
  public void enableSideMove(){
    //if(canMove){
      if(key == 'a'){
        entitySpeed.x = -6;
      }
      
      if(key == 'd'){
        entitySpeed.x = 6; 
      }
    //}
  }
  
  public void enableDrop(){
     if(key == 's'){
       platformEnabled = false;
       contactPlatform = false;
     }
  }
  public void checkStopSideMove(){
    if(key == 'a' || key == 'd'){
      entitySpeed.x = 0;
    }
  }
}
