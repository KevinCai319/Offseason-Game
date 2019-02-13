public class ControllableEntity {
  
  PVector entityLocation;
  PVector entityDimensions;
  float ySpeed;
  float xSpeed;
  boolean canJump;
  boolean jumping;
  boolean onGround;
  //boolean canMove;
  boolean moving;
  
  ControllableEntity(PVector entityLocation, PVector entityDimensions){
    this.entityLocation = entityLocation;
    this.entityDimensions = entityDimensions;  
  }
  
  public void drawCEntity(){
    rect(entityLocation.x, entityLocation.y, entityDimensions.x, entityDimensions.y); 
    entityLocation.y += ySpeed;
    entityLocation.x += xSpeed;
    
    if(jumping){
      canJump = false;
    }else{
      canJump = true; 
    }
  }
  
  public void checkGroundCollision(Ground specificGround){
    onGround = entityLocation.y + entityDimensions.y >= specificGround.yPosition;
    
    if(onGround){
      entityLocation.y = specificGround.yPosition - entityDimensions.y;
      jumping = false;
    }else{
      ySpeed++;
    }
  }
  
  public void enableJump(){
    if(canJump){
      if(key == ' '){
        ySpeed = -15;
        jumping = true;
      }
    }
  }
  
  public void enableSideMove(){
    //if(canMove){
      if(key == 'a'){
        xSpeed = -3;
      }
      
      if(key == 'd'){
        xSpeed = 3; 
      }
    //}
  }
  
  public void checkStopSideMove(){
    if(key == 'a' || key == 'd'){
      xSpeed = 0;
    }
  }
}
