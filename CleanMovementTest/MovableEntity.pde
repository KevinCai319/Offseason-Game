public class MovableEntity{
    
  PVector entityLocation;
  PVector entityDimensions;
  PVector entitySpeed;
  float gravity; // Gravity speed
  boolean inAir; // To see if entity is jumping
  boolean contactPlatform; // Used to determine if bottom of entity is on or below platform
  boolean moving; // Currently unused.
  boolean dropping; // Used only for dropping through platforms. Set to true by key input.
  
  MovableEntity(PVector entityLocation, PVector entityDimensions, float gravity){
    this.entityLocation = entityLocation;
    this.entityDimensions = entityDimensions;  
    entitySpeed = new PVector(0,0);
    this.gravity = gravity;
  }
  
  // Updates entity position and redraws visual position
  public void updateCEntity(){
    entityLocation.add(entitySpeed);
    rect(entityLocation.x, entityLocation.y, entityDimensions.x, entityDimensions.y); 
  }
  
  // Gravity acceleration by adding to speed instead of position. Adjustable.
  public void checkGravity(){
    if(!contactPlatform) entitySpeed.y += gravity;
  }
  
  // Activates hitbox of platform if the player has already gone above the platform and is within its x bounds.
  public void checkPlatformCollision(Platform specificPlatform){
    boolean abovePlatform = entityLocation.y + entityDimensions.y < specificPlatform.yPosition;
    boolean inXArea = entityLocation.x + entityDimensions.x > specificPlatform.xLeft && entityLocation.x < specificPlatform.xRight;
    
    // Enables hitbox
    if(specificPlatform.droppable){
      if(abovePlatform && inXArea && !dropping) specificPlatform.platformEnabled = true;
    }else{
      if(abovePlatform && inXArea) specificPlatform.platformEnabled = true;
    }
    
    // The actual hitbox
    if(specificPlatform.platformEnabled){
      if(!abovePlatform){
        entityLocation.y = specificPlatform.yPosition - entityDimensions.y;
        entitySpeed.y = 0;
        
        contactPlatform = true;
        inAir = false;
      }else{
        contactPlatform = false;
      }        
      
      // Handles dropping from key input. Disables platform hitbox.
      if(specificPlatform.droppable){
        if(!inXArea || dropping){
          specificPlatform.platformEnabled = false;
          contactPlatform = false;
          inAir = true;
        }
      }else{
        // Drops player if it leaves the x bounds.
        if(!inXArea){
          specificPlatform.platformEnabled = false;
          contactPlatform = false;
          inAir = true;
        }
      }
    }else{
      contactPlatform = false;
    }
  }

}
