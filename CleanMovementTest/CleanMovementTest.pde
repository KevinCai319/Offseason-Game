KeyListener keys; // For key input
ControllableEntity player;
LevelLoader levelLoader;

void setup(){
  size(1000, 500);
  keys = new KeyListener();
  player = new ControllableEntity(new PVector(width/2, 50), new PVector(25, 60), 0.6472135955, 8.09016994375, 12.94427191, 1.21352549156);
  levelLoader = new LevelLoader("Plains", "West");
}

void draw(){
  clear();
  background(0);
  fill(255);
  stroke(125);
  
  keys.update();
  levelLoader.loadLevel();
  player.enableMovement();
  levelLoader.activateCollision(player);
  player.updateCEntity();
}

void keyPressed(){
  keys.keyUpdate(true);
}

void keyReleased(){
  keys.keyUpdate(false);  
}
