public class RegenLimb extends Limb{
  public RegenLimb(){
  }
  public RegenLimb(ArrayList<Joint> joints){
    super(joints);
  }
  public void gen(){
    if( joints != null || joints.size() > 0){
      super.add(getLast().gen());
    }
  }
  
}
