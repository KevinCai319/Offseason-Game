import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CleanMovementTest extends PApplet {

ControllableEntity player;
Ground ground;
Platform testingPlatform;
Platform testingPlatform2;

public void setup() {
  
  player = new ControllableEntity(new PVector(245, 50), new PVector(25, 60), 0.25f);
  ground = new Ground(400);
  testingPlatform = new Platform(150, 350, 325, true);
  testingPlatform2 = new Platform(150, 350, 250, true);
}

public void draw() {
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

public void keyPressed() {
  player.enableJump();
  player.enableSideMove();
  player.enableDrop();
}

public void keyReleased() {
  player.checkStopSideMove();
  player.checkStopDrop();
}
public class ControllableEntity extends MovableEntity {

  public ControllableEntity(PVector entityLocation, PVector entityDimensions, float gravity) {
    super(entityLocation, entityDimensions, gravity);
  }

  public void enableJump() {
    if(!super.inAir && key == ' ') {
      super.entitySpeed.y = -7.5f;
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
public class Ground extends Platform {

  Ground(float yPosition) {
    super(-100, width + 100, yPosition, false);
  }

}
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
public class Platform {

  float xLeft;
  float xRight;
  float yPosition;
  boolean platformEnabled;
  boolean droppable;

  public Platform(float xLeft, float xRight, float yPosition, boolean droppable) {
    this.xLeft = xLeft;
    this.xRight = xRight;
    this.yPosition = yPosition;
    this.droppable = droppable;
    platformEnabled = false;
  }

  public void drawPlatform() {
    line(xLeft, yPosition, xRight, yPosition);
  }
  
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CleanMovementTest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
