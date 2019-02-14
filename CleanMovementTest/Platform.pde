public class Platform{
  
  float xLeft;
  float xRight;
  float yPosition;
  
  public Platform(float xLeft, float xRight, float yPosition){
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yPosition = yPosition;
  }
  
  public void drawPlatform(){
    line(xLeft, yPosition, xRight, yPosition);
  }
}
