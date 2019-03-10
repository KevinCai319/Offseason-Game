import java.io.*;
import java.util.*;
public class LevelLoader{
  
  ArrayList<Platform> platforms = new ArrayList<Platform>();
  ArrayList<Wall> walls = new ArrayList<Wall>();
  String left = "none", right = "none", up = "none", down = "none";

  public LevelLoader(){
  }
  
  public void loadLevel(){
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
  
  public void getLevel(String level, String subLevel){
    platforms.clear();
    walls.clear();
    ArrayList<String> data = new ArrayList<String>(Arrays.asList(loadStrings("LevelData/" + level + "/" + subLevel + ".txt"))); 
    
    for(String dataLine: data){
      try{
        ArrayList<String> dataSplit = new ArrayList<String>(Arrays.asList(dataLine.split(" ")));
        String dataType = dataSplit.get(0);
        
        if(dataType.equals("Ground") == true){
          platforms.add(new Ground(Float.parseFloat(dataSplit.get(1)))); 
        }else if(dataType.equals("Platform") == true){
          platforms.add(new Platform(Float.parseFloat(dataSplit.get(1)), 
                                     Float.parseFloat(dataSplit.get(2)), 
                                     Float.parseFloat(dataSplit.get(3)), 
                                     Float.parseFloat(dataSplit.get(4)), 
                                     Boolean.parseBoolean(dataSplit.get(5))));            
        }else if(dataType.equals("Wall")){
          walls.add(new Wall(Float.parseFloat(dataSplit.get(1)),
                             Float.parseFloat(dataSplit.get(2)),
                             Float.parseFloat(dataSplit.get(3)),
                             Float.parseFloat(dataSplit.get(4))));
        }else if(dataType == "Left"){
          
        }else if(dataType == "Right"){
          
        }else if(dataType == "Up"){
          
        }else if(dataType == "Down"){
          
        }else{
          
        }
      }catch(Exception e){
        println("rip");
      }
    }
    loadLevel();
  }
  
  public void activateCollision(MovableEntity entity){
    entity.checkAllPlatformCollision(platforms);
    entity.checkAllWallCollision(walls);
  }
  
}
