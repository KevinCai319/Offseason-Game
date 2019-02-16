GameHandler handle = new GameHandler();
KeyListener keys = new KeyListener();

void setup() {
  size(400,400);
  handle.UI.add((new HealthBar(10, 10, 100, 30, 5, 0, 150, color(0), color(255,0,0), color(0,255,0))));
  handle.MainLayer.add(new Player(new PVector(width/2,height/2)));
}

void draw() {
  clear();
  background(255);
  keys.update();
  handle.drawGame();
}

public void keyPressed() {
  keys.keyUpdate(true);
}

public void keyReleased() {
  keys.keyUpdate(false);
}
