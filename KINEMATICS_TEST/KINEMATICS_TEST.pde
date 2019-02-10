KeyListener keys = new KeyListener();
void setup(){
}
void draw(){
  System.out.println(keys);
  keys.update();
}
public void keyPressed(){
  keys.keyUpdate(true);
}
public void keyReleased(){
  keys.keyUpdate(false);
}
