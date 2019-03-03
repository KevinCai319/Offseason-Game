import java.io.*;
import java.util.*;
public class LevelLoader{
  
  ArrayList<Platform> platforms = new ArrayList<Platform>();
  
  public LevelLoader(){
  }
  
  public void addPlatform(Platform platform){
    platforms.add(platform);
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
      println(platformData); 
    } 
  }
  
  public void checkLevelEntityCollision(MovableEntity specificEntity){
    for(Platform platform: platforms){
      specificEntity.checkPlatformCollision(platform);
    }
  }
  
}
