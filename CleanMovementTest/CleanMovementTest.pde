ControllableEntity player;
Ground ground;
Platform testingPlatform;
Platform testingPlatform2;

void setup() {
  size(500, 500);
  player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 0.25);
  ground = new Ground(400);
  testingPlatform = new Platform(150, 350, 325, true);
  testingPlatform2 = new Platform(150, 350, 250, true);
}

void draw() {
  background(0);
  fill(255);
  stroke(255);
  ground.drawPlatform();
  player.drawCEntity();
  testingPlatform.drawPlatform();
  testingPlatform2.drawPlatform();
  player.checkPlatformCollision(ground);
  player.checkPlatformCollision(testingPlatform);
  player.checkPlatformCollision(testingPlatform2);
  player.checkGravity();

}

void keyPressed() {
  player.enableJump();
  player.enableSideMove();
  player.enableDrop();
}

void keyReleased() {
  player.checkStopSideMove();
  player.checkStopDrop();
}
