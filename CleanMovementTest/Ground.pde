public class Ground extends Platform{
  
  Ground(float yPosition){
    super(0, width, yPosition, width - yPosition, false);
  }

}