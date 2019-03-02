public class Platform{
  
  float xLeft; // Left bound of platform
  float xRight; // Right bound of platform
  float yPosition;
  boolean platformEnabled; // Used for its hitbox in MovableEntity.
  boolean droppable; // Allows dropping to disable the hitbox to fall through
  
  public Platform(float xLeft, float xRight, float yPosition, boolean droppable){
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yPosition = yPosition;
    this.droppable = droppable;
    platformEnabled = false; // By default
  }
  
  public void drawPlatform(){
    line(xLeft, yPosition, xRight, yPosition);
  }
  
}
