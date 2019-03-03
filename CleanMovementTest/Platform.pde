public class Platform{
  
  float xLeft; // Left bound of platform
  float xRight; // Right bound of platform
  float yPosition;
  boolean platformEnabled; // Used for its hitbox in MovableEntity.
  boolean droppable; // Allows dropping to disable the hitbox to fall through
  float thickness;
  
  public Platform(float xLeft, float xRight, float yPosition, float thickness, boolean droppable){
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yPosition = yPosition;
    this.droppable = droppable;
    platformEnabled = false; // By default
    this.thickness = thickness;
  }
  
  public void drawPlatform(){
    rect(xLeft, yPosition, xRight - xLeft, thickness);
  }

}
