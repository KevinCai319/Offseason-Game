KeyListener keys = new KeyListener();
RegenLimb startLimb = new RegenLimb();
Joint testJoint = new Joint(400,400,0,90);
Joint testJoint2 = new Joint(490,490,-30,0);
Joint testJoint3 = new Joint(460,520,-90,-50);
float x = 65.2;
float y = 65.2;
void setup(){
  startLimb.add(new Joint(new PVector(width/4.0,height/4.0),60,60));
  for(int i = 0; i < 5; i++){
    startLimb.gen();
  }
  //testJoint.solve(testJoint2,new PVector(60,120));
  size(1080,900);
}
void draw(){
  clear();
  background(255, 204, 0);
  testJoint.solve(testJoint2,new PVector(x,y));
  System.out.println(new PVector(mouseX-testJoint.pos.x,mouseY-testJoint.pos.y));
  x += 0.02;
  y += 0.02;
  //testJoint.superSolve(testJoint2);
  testJoint.draw();
  testJoint2.draw();
  testJoint3.draw();
  
  startLimb.moveTo(PVector.sub(new PVector(mouseX,mouseY),startLimb.getFirst().pos));
  startLimb.update();
  keys.update();
}
public void keyPressed(){
  keys.keyUpdate(true);
}
public void keyReleased(){
  keys.keyUpdate(false);
}