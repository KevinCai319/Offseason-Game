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
    ArrayList<String> data = new ArrayList<String>(Arrays.asList(loadStrings("..\\LevelData\\" + level + "\\" + subLevel + ".txt"))); 
    
    for(String platformData: data){
      try{
        if(platformData.length() == 3){
          platforms.add(new Ground(Float.parseFloat(platformData))); 
        }else{
          platforms.add(new Platform(Float.parseFloat(platformData.substring(0, 4)), 
                                     Float.parseFloat(platformData.substring(5, 9)), 
                                     Float.parseFloat(platformData.substring(10,14)), 
                                     Float.parseFloat(platformData.substring(15, 19)), 
                                     Boolean.parseBoolean(platformData.substring(20, 24))));
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
