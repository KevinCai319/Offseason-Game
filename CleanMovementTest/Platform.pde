public class Platform{
  
  float xLeft;
  float xRight;
  float yPosition;
  boolean platformEnabled;
  boolean droppable;
  
  public Platform(float xLeft, float xRight, float yPosition, boolean droppable){
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yPosition = yPosition;
    this.droppable = droppable;
    platformEnabled = false;
  }
  
  public void drawPlatform(){
    line(xLeft, yPosition, xRight, yPosition);
  }
}
