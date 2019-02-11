public class Limb{
  ArrayList<Joint> joints;
  PVector target = new PVector(0,0);
  PVector end = new PVector(0,0);
  double range = 0;
  float animSpeed = 0.4;
  public Limb(){
    joints = new ArrayList<Joint>();
  }
  public Limb(ArrayList<Joint> joints){
    this.joints = joints;
    for(Joint i:joints){
      range += i.length;
    }
    setEnd();
  }
  public void moveTo(PVector relativePos){
    if(relativePos.mag() > range){
      relativePos.setMag((float) range);
    }
    target = relativePos;
  }
  private void draw(){
    strokeWeight(5);
    for(Joint i:joints){
      i.draw();
    }
    strokeWeight(40);
    line(end.x,end.y,end.x,end.y);
    strokeWeight(5);
    
  }
  protected void add(Joint joint){
    range += joint.length;
    joints.add(joint);
  }
  protected void remove(int index){
    range -= joints.remove(index).length;
  }
  public void update(){
    setEnd();
    if(PVector.sub(target,PVector.sub(end,getFirst().pos)).mag() > 0.1){
      end.lerp(target,animSpeed);
    }
    draw();
  }
  public Joint getFirst(){return joints.get(0);}
  public Joint getLast(){return joints.get(joints.size()-1);}
  protected void setEnd(){
    end = PVector.add(getLast().pos,getLast().jointLength);
  }
  // get new angles
  private void solve(Joint p_1, Joint p_2, PVector movement){
      float theta2 = acos(movement.x*movement.x+
                          movement.y*movement.y);
                          //TODO: finish this;
                          
  }
    // Overall angle of arm, in degrees
  public double getAngle(){
    return CoolVector.getAngle(getFirst().pos,getLast().pos);
  }
  
}
