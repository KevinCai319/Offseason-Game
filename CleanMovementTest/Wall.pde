public class Wall{
  float xLeft; // Left bound of platform
  float xRight; // Right bound of platform
  float yTop;
  float yBottom;
  boolean platformEnabled; // Used for its hitbox in MovableEntity.
  
  public Wall(float xLeft, float xRight, float yTop, float yBottom){
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yTop = yTop;
    this.yBottom = yBottom;
    platformEnabled = false; // By default
  }
  
  public void drawPlatform(){
    rect(xLeft, yTop, xRight - xLeft, yBottom);
  }
}