public class ControllableEntity extends MovableEntity{
  
  float setSideSpeed;
  float setJumpForce;
  
  public ControllableEntity(PVector entityLocation, PVector entityDimensions, float gravity, float setSideSpeed, float setJumpForce){
    super(entityLocation, entityDimensions, gravity);
    this.setSideSpeed = setSideSpeed;
    this.setJumpForce = setJumpForce;
  }
  
  // Enables all movement from key presses.
  public void enableMovement(){
    enableJump();
    enableSideMove();
    enableDrop();
  }
  
  // Stops certain movement when certain keys are released.
  public void stopMovement(){
    checkStopSideMove();
    checkStopDrop();
  }
  
  // Sets y speed to negative if the player is not in air and if spacebar is pressed.
  public void enableJump(){
    if(!super.inAir && keys.getState(32) == KeyState.HELD){
      super.entitySpeed.y = -setJumpForce;
      super.inAir = true;
    }
  }
  
  // Sets x speed to 0 if both left and right are pressed, otherwise sets x speed based on which key is pressed.
  public void enableSideMove(){
    if(keys.getState('a') == KeyState.HELD && keys.getState('d') == KeyState.HELD){
      super.entitySpeed.x = 0;
    }else{
      if(keys.getState('a') == KeyState.HELD){
        super.entitySpeed.x = -setSideSpeed;
      }
        
      if(keys.getState('d') == KeyState.HELD){
        super.entitySpeed.x = setSideSpeed; 
      }
    }
  }
  
  // Disables platform hitbox when down is pressed.
  public void enableDrop(){
     if(keys.getState('s') == KeyState.HELD) super.dropping = true;
  }
  
  // Stops player from moving sideways forever after key is released.
  public void checkStopSideMove(){
    if(keys.getState('a') == KeyState.NOTHELD && keys.getState('d') == KeyState.NOTHELD) super.entitySpeed.x = 0;
  }
  
  // Allows platform hitboxes to be enabled when down is not pressed
  public void checkStopDrop(){
    if(keys.getState('s') == KeyState.NOTHELD) super.dropping = false;
  }
}
