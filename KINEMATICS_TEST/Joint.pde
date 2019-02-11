public class Joint{
  private PVector pos;
  private PVector jointLength;
  private float angle;
  public float length;
  public Joint(PVector pos,PVector jointLength){
    this.pos = pos;
    this.jointLength = jointLength;
    length = jointLength.mag();
    angle = (float) CoolVector.getAngle(jointLength);
  }
  public Joint(int posX,int posY,int jointLengthX,int jointLengthY){
    this(new PVector(posX,posY),new PVector(jointLengthX,jointLengthY));
  }
  public Joint(PVector pos,int jointLengthX,int jointLengthY){
    this(pos,new PVector(jointLengthX,jointLengthY));
  }
  public Joint(Joint parent){
    this(PVector.add(parent.pos,parent.jointLength),parent.jointLength);
  }
  public Joint(Joint parent,int length){
    this(PVector.add(parent.pos,parent.jointLength),new PVector(length,0));
  }
  public void draw(){
    relativeLine(pos,jointLength);
  }
  public Joint gen(){
    return new Joint(this);
  }
  private void relativeLine(PVector a, PVector b){
    color(255);
    strokeWeight(10);
    line(a.x,a.y,a.x,a.y);
    strokeWeight(5);
    line(a.x,a.y,a.x+b.x,a.y+b.y);
  }
  public void set(PVector pos){
    this.pos = pos;
  }
  public void lerp(PVector pos,float speed){
    this.pos.lerp(pos,speed);
  }
  public void translate(PVector pos){
    this.pos.add(pos);
  }
  
  // relative rotation, put in degrees
  public void rotate(float rotation){
    angle += rotation;
    jointLength.x = cos(angle)*length;
    jointLength.y = sin(angle)*length;
  }
}
