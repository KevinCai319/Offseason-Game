public abstract class ShapeTrigger extends Physical{
  PShape area;
  public ShapeTrigger(PVector pos, PShape area){
    super(pos);
    this.area = area;
  }
  public void addChild(PShape area){
    area.addChild(area);
  }
  public abstract boolean isTriggered();
  
}