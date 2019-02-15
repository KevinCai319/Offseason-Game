public class HealthBar extends GameObject{
  
  PVector Pos;
  PVector Dim;
  PVector Range;
  float currentValue;
  color borderColor,emptyColor,fullColor;
  
  float insideBarLength;
  float insideBarWidth;
  float percentageOfMax;
  
  public HealthBar(float XPos, float YPos, float Length, float Width, 
  float borderWidth, float min, float max, color borderColor, 
  color emptyColor, color fullColor){
    this(new PVector(XPos,YPos),new PVector(Length,Width,borderWidth),
         new PVector(min,max),borderColor,emptyColor,fullColor);
  
  }
  public HealthBar(PVector Pos, PVector Dim, PVector Range, color borderColor, 
  color emptyColor, color fullColor){
    this.Pos = Pos;
    this.Dim = Dim;
    this.Range = Range;
    this.borderColor = borderColor;
    
    this.emptyColor = emptyColor;
    this.fullColor = fullColor;
    
    currentValue = Range.y;
    insideBarLength = Dim.x - (Dim.z * 2);
    insideBarWidth = Dim.y - (Dim.z * 2);
    percentageOfMax = (currentValue - Range.x)/(Range.y - Range.x);
  }
  
  public void render(){
    noStroke();
    fill(borderColor);
    rect(Pos.x, Pos.y, Dim.x, Dim.y);
    fill(emptyColor);
    rect(Pos.x + Dim.z, Pos.y + Dim.z, insideBarLength, insideBarWidth);
    fill(fullColor);
    rect(Pos.x + Dim.z, Pos.y + Dim.z, percentageOfMax * insideBarLength, 
    insideBarWidth);
  }
  public void update(){
    render();
  }
  
  public void changeValue(float drainRate){
    currentValue -= drainRate;
    if (currentValue < Range.x){
      currentValue = Range.x;
    }
    percentageOfMax = (currentValue - Range.x)/(Range.y - Range.x);
  }
}