ControllableEntity player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60));
Ground ground = new Ground(400);

void setup(){
  size(500, 500);
}

void draw(){
  background(120);
  ground.drawGround();
  player.drawCEntity();
  player.checkGroundCollision(ground);
}

void keyPressed(){
  player.enableJump();
  player.enableSideMove();
}

void keyReleased(){
  player.checkStopSideMove();
}
