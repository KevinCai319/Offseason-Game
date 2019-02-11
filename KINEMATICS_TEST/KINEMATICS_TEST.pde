KeyListener keys = new KeyListener();
RegenLimb startLimb = new RegenLimb();
Joint testJoint = new Joint(400,400,90,90);
void setup(){
  startLimb.add(new Joint(new PVector(width/4.0,height/4.0),60,60));
  for(int i = 0; i < 5; i++){
    startLimb.gen();
  }
  size(1080,900);
}
void draw(){
  clear();
  background(255, 204, 0);
  testJoint.rotate((float)Math.PI/360);
  testJoint.draw();
  startLimb.moveTo(PVector.sub(new PVector(mouseX,mouseY),startLimb.getFirst().pos));
  startLimb.update();
  System.out.println(startLimb.getAngle());
  keys.update();
}
public void keyPressed(){
  keys.keyUpdate(true);
}
public void keyReleased(){
  keys.keyUpdate(false);
}
