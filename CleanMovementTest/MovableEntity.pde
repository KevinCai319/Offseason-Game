public class MovableEntity {

  PVector entityLocation;
  PVector entityDimensions;
  PVector entitySpeed;
  float gravity; // Gravity speed
  boolean inAir; // To see if entity is jumping
  boolean contactPlatform; // Used to determine if bottom of entity is on or below platform
  boolean moving;
  boolean dropping;

  MovableEntity(PVector entityLocation, PVector entityDimensions, float gravity) {
    this.entityLocation = entityLocation;
    this.entityDimensions = entityDimensions;
    entitySpeed = new PVector(0,0);
    this.gravity = gravity;
  }

  public void drawCEntity() {
    rect(entityLocation.x, entityLocation.y, entityDimensions.x, entityDimensions.y);
    entityLocation.add(entitySpeed);
  }

  public void checkGravity() {
    if(!contactPlatform) {
      entitySpeed.y += gravity;
    }
  }

  public void checkPlatformCollision(Platform specificPlatform) {
    boolean abovePlatform = entityLocation.y + entityDimensions.y < specificPlatform.yPosition;
    boolean inXArea = entityLocation.x + entityDimensions.x > specificPlatform.xLeft && entityLocation.x < specificPlatform.xRight;

    if(specificPlatform.droppable) {
      if(abovePlatform && inXArea && !dropping) {
        specificPlatform.platformEnabled = true;
      }
    } else {
      if(abovePlatform && inXArea) {
        specificPlatform.platformEnabled = true;
      }
    }

    if(specificPlatform.platformEnabled) {
      if(!abovePlatform) {
        entityLocation.y = specificPlatform.yPosition - entityDimensions.y;
        entitySpeed.y = 0;

        contactPlatform = true;
        inAir = false;
      } else {
        contactPlatform = false;
      }

      if(specificPlatform.droppable) {
        if(!inXArea || dropping) {
          specificPlatform.platformEnabled = false;
          contactPlatform = false;
          inAir = true;
        }
      } else {
        if(!inXArea) {
          specificPlatform.platformEnabled = false;
          contactPlatform = false;
          inAir = true;
        }
      }
    } else {
      contactPlatform = false;
    }
  }

}
