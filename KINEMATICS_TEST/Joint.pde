public class Joint{
  PVector pos;
  public Joint(PVector pos){
    this.pos = pos;
  }
  public void set(PVector pos){
    this.pos = pos;
  }
  public void translate(PVector pos){
    this.pos.add(pos);
  }
}
