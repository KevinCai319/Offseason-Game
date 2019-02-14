ControllableEntity player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 1);
Ground ground = new Ground(400);
Platform testingPlatform = new Platform(150, 350, 325);

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  fill(255);
  stroke(255);
  ground.drawGround();
  player.drawCEntity();
  testingPlatform.drawPlatform();
  player.checkGroundCollision(ground);
  player.checkPlatformCollision(testingPlatform);
  player.checkGravity();

}

void keyPressed(){
  player.enableJump();
  player.enableSideMove();
  player.enableDrop();
}

void keyReleased(){
  player.checkStopSideMove();
}
