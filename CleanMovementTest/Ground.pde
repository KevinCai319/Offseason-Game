public class Ground{
  
  float yPosition;
  
  Ground(float yPosition){
    this.yPosition = yPosition;
  }
  
  public void drawGround(){
    line(0, yPosition, width, yPosition);
  }
}
