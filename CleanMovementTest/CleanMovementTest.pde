KeyListener keys; // For key input
ControllableEntity player;
LevelLoader levelLoader;
ArrayList<Wall> walls = new ArrayList<Wall>();
Wall rightWall;
Wall leftWall;

void setup(){
  size(1000, 500);
  keys = new KeyListener();
  player = new ControllableEntity(new PVector(width/2, 50), new PVector(25, 60), 0.4, 8, 10, 1);
  levelLoader = new LevelLoader();
  leftWall = new Wall(-5, 0, 0, height);
  rightWall = new Wall(width, width + 5, 0, height);
  walls.add(leftWall);
  walls.add(rightWall);
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
  player.checkAllWallCollision(walls);
  player.enableMovement();
  
  player.updateCEntity();  
  player.checkWall(leftWall);
  player.checkWall(rightWall);
}

void keyPressed(){
  keys.keyUpdate(true);
}

void keyReleased(){
  keys.keyUpdate(false);  
}