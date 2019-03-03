KeyListener keys; // For key input
ControllableEntity player;
ArrayList<Platform> testingPlatforms = new ArrayList<Platform>();
LevelLoader levelLoader;

void setup(){
  size(500, 500);
  keys = new KeyListener();
  player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 0.4, 8, 10, 1);
  testingPlatforms.add(new Ground(400));
  testingPlatforms.add(new Platform(150, 350, 325, 5, true));
  testingPlatforms.add(new Platform(150, 350, 250, 5, true));
  levelLoader = new LevelLoader();
}

void draw(){
  clear();
  background(0);
  fill(255);
  stroke(125);
  
  keys.update();

  levelLoader.drawAllPlatforms(testingPlatforms);
  levelLoader.getLevel("Plains", "West");
  
  player.enableMovement();
  player.checkGravity();
  player.checkAllPlatformCollision(testingPlatforms);
  player.updateCEntity();
}

void keyPressed(){
  keys.keyUpdate(true);
}

void keyReleased(){
  keys.keyUpdate(false);
}
