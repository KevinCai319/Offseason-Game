KeyListener keys; // For key input
ControllableEntity player;
Ground ground; 
ArrayList<Platform> testingPlatform = new ArrayList<Platform>();

void setup(){
  size(500, 500);
  keys = new KeyListener();
  player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 0.4, 6, 10);
  ground = new Ground(400);
  testingPlatform.add(new Platform(150, 350, 325, true));
  testingPlatform.add(new Platform(150, 350, 250, true));
}

void draw(){
  clear();
  background(0);
  fill(255);
  stroke(255);
  
  keys.update();
  ground.drawPlatform();
  player.updateCEntity();

  player.checkPlatformCollision(ground);
  
  //Checks collision for all platforms
  for(Platform platform: testingPlatform){
    platform.drawPlatform();
    player.checkPlatformCollision(platform);
  }
  
  player.checkGravity();
  player.enableMovement();
  player.stopMovement();
}

void keyPressed(){
  keys.keyUpdate(true);
}

void keyReleased(){
  keys.keyUpdate(false);
}
