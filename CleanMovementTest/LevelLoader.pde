import java.io.*;
import java.util.*;
public class LevelLoader{
  
  ArrayList<Platform> platforms = new ArrayList<Platform>();
  
  public LevelLoader(){
  }
  
  public void loadLevel(){
    drawAllPlatforms(platforms);
  }
  
  public void drawAllPlatforms(ArrayList<Platform> platforms){
    for(Platform platform: platforms){
      platform.drawPlatform();
    }
  }
  
  public void getLevel(String level, String subLevel){
    platforms.clear();
    ArrayList<String> data = new ArrayList<String>(Arrays.asList(loadStrings("LevelData/" + level + "/" + subLevel + ".txt"))); 
    
    for(String platformData: data){
      try{
        if(platformData.length() == 3){
          platforms.add(new Ground(Float.parseFloat(platformData))); 
        }else{
          ArrayList<String> platformSplit = new ArrayList<String>(Arrays.asList(platformData.split(" ")));
          
          platforms.add(new Platform(Float.parseFloat(platformSplit.get(0)), 
                                     Float.parseFloat(platformSplit.get(1)), 
                                     Float.parseFloat(platformSplit.get(2)), 
                                     Float.parseFloat(platformSplit.get(3)), 
                                     Boolean.parseBoolean(platformSplit.get(4))));
        }
      }catch(Exception e){
        println("Error in level data!");
      }
    } 
  }
  
  public void activateCollision(MovableEntity entity){
    entity.checkAllPlatformCollision(platforms);
  }
  
}