KeyListener keys; // For key input
ControllableEntity player;
LevelLoader levelLoader;

void setup(){
  size(500, 500);
  keys = new KeyListener();
  player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 0.4, 8, 10, 1);
  levelLoader = new LevelLoader();
}

void draw(){
  clear();
  background(0);
  fill(255);
  stroke(125);
  
  keys.update();
  player.checkGravity(); // For some reason this is wack and has to be placed before collision

  levelLoader.getLevel("Plains", "West");
  levelLoader.loadLevel();
  levelLoader.activateCollision(player);
  
  player.enableMovement();
  player.checkWalls();
  player.updateCEntity();  
  
}

void keyPressed(){
  keys.keyUpdate(true);
}

void keyReleased(){
  keys.keyUpdate(false);
}