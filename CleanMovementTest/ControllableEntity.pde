public class ControllableEntity extends MovableEntity {

  public ControllableEntity(PVector entityLocation, PVector entityDimensions, float gravity) {
    super(entityLocation, entityDimensions, gravity);
  }

  public void enableJump() {
    if(!super.inAir && key == ' ') {
      super.entitySpeed.y = -7.5;
      super.inAir = true;
    }
  }

  public void enableSideMove() {
    if(key == 'a') {
      super.entitySpeed.x = -6;
    }

    if(key == 'd') {
      super.entitySpeed.x = 6;
    }

  }

  public void enableDrop() {
     if(key == 's') {
       super.dropping = true;
     }
  }

  public void checkStopSideMove() {
    if(key == 'a' || key == 'd') {
      super.entitySpeed.x = 0;
    }
  }

  public void checkStopDrop() {
    if(key == 's') {
      super.dropping = false;
    }
  }
  
}
