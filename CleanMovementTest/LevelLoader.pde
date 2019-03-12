import java.io.*;
import java.util.*;
public class LevelLoader{
  
  ArrayList<Platform> platforms = new ArrayList<Platform>();
  ArrayList<Wall> walls = new ArrayList<Wall>();
  String level, subLevel;
  String left, leftSub, right, rightSub, up, upSub, down, downSub;
  float groundHeight;
  
  public LevelLoader(String defaultLevel, String defaultSubLevel){
    level = defaultLevel;
    subLevel = defaultSubLevel;
  }
  
  public void drawLevel(){
    drawAllPlatforms(platforms);
    drawAllWalls(walls);
  }
  
  public void drawAllPlatforms(ArrayList<Platform> platforms){
    for(Platform platform: platforms){
      platform.drawPlatform();
    }
  }
  
  public void drawAllWalls(ArrayList<Wall> walls){
    for(Wall wall: walls){
      wall.drawWall();
    }
  }
  
  public void enableTriggerLoadingZone(MovableEntity entity){

    if(left.equals("none")){
      walls.add(new Wall(-5, 0, 0, height));
    }else{
      if(entity.entityLocation.x + entity.entityDimensions.x < 0){
        clear();
        level = left;
        subLevel = leftSub;
        entity.entityLocation.x = width - entity.entityDimensions.x;
        if(entity.entityLocation.y + entity.entityDimensions.y > groundHeight) {
          entity.entitySpeed.y = 0;
          entity.entityLocation.y = groundHeight - entity.entityDimensions.y;
        }
      }
    }
    
    if(right.equals("none")){
      walls.add(new Wall(width, width + 5, 0, height));
    }else{
      if(entity.entityLocation.x > width){
        clear();
        level = right; 
        subLevel = rightSub;
        entity.entityLocation.x = 0;
        if(entity.entityLocation.y + entity.entityDimensions.y > groundHeight) {
          entity.entitySpeed.y = 0;
          entity.entityLocation.y = groundHeight - entity.entityDimensions.y;
        }
      }
    }
    
    if(!up.equals("none") && entity.entityLocation.y + entity.entityDimensions.y < 0) {
      level = up;
      subLevel = upSub;
    }
    
    if(down.equals("none")){
      platforms.add(new Ground(height));
    }else{
      if(entity.entityLocation.y > height) {
        level = down;
        subLevel = downSub;
      }
    }
  }
  
  public void loadLevel(){
    left = "none";
    right = "none"; 
    up = "none";
    down = "none";
    leftSub = "none";
    rightSub = "none";
    upSub = "none";
    downSub = "none";
    platforms.clear();
    walls.clear();
    ArrayList<String> data = new ArrayList<String>(Arrays.asList(loadStrings("LevelData/" + level + "/" + subLevel + ".txt"))); 
    
    for(String dataLine: data){
      try{
        ArrayList<String> dataSplit = new ArrayList<String>(Arrays.asList(dataLine.split(" ")));
        String dataType = dataSplit.get(0).toLowerCase();
        
        if(dataType.equals("ground")){
          groundHeight = Float.parseFloat(dataSplit.get(1));
          platforms.add(new Ground(Float.parseFloat(dataSplit.get(1)))); 
        }else if(dataType.equals("platform")){
          platforms.add(new Platform(Float.parseFloat(dataSplit.get(1)), 
                                     Float.parseFloat(dataSplit.get(2)), 
                                     Float.parseFloat(dataSplit.get(3)), 
                                     Float.parseFloat(dataSplit.get(4)), 
                                     Boolean.parseBoolean(dataSplit.get(5))));            
        }else if(dataType.equals("wall")){
          walls.add(new Wall(Float.parseFloat(dataSplit.get(1)),
                             Float.parseFloat(dataSplit.get(2)),
                             Float.parseFloat(dataSplit.get(3)),
                             Float.parseFloat(dataSplit.get(4))));
        }else if(dataType.equals("left")){
          left = dataSplit.get(1);
          leftSub = dataSplit.get(2);
        }else if(dataType.equals("right")){
          right = dataSplit.get(1);
          rightSub = dataSplit.get(2);
        }else if(dataType.equals("up")){
          up = dataSplit.get(1);
          upSub = dataSplit.get(2);
        }else if(dataType.equals("down")){
          down = dataSplit.get(1);
          downSub = dataSplit.get(2);
        }else{
          
        }
      }catch(Exception e){
        println("rip");
      }
    }

    drawLevel();

  }
  
  public void activateCollision(MovableEntity entity){
    enableTriggerLoadingZone(entity);
    entity.checkAllPlatformCollision(platforms);
    entity.checkAllWallCollision(walls);
  }
  
}
