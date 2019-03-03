KeyListener keys; // For key input
ControllableEntity player;
Ground ground; 
ArrayList<Platform> testingPlatform = new ArrayList<Platform>();

void setup(){
  size(500, 500);
  keys = new KeyListener();
  player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 0.4, 6, 10, 1);
  ground = new Ground(400);
  testingPlatform.add(new Platform(150, 350, 325, true, 5));
  testingPlatform.add(new Platform(150, 350, 250, true, 5));
}

void draw(){
  clear();
  background(0);
  fill(255);
  stroke(125);
  
  keys.update();

  player.enableMovement();
  player.stopMovement();

  player.checkGravity();
  
  player.checkPlatformCollision(ground);
  //Checks collision for all platforms
  for(Platform platform: testingPlatform){
    platform.drawPlatform();
    player.checkPlatformCollision(platform);
  }
  ground.drawPlatform();
  player.updateCEntity();
}

void keyPressed(){
  keys.keyUpdate(true);
}

void keyReleased(){
  keys.keyUpdate(false);
}
