 public class GameHandler {

  GameLayer UI;
  GameLayer MainLayer;
  GameLayer Background;

  public GameHandler() {
    UI = new GameLayer();
    MainLayer = new GameLayer();
    Background = new GameLayer();
  }

  public void drawGame() {
    Background.drawLayer();
    MainLayer.drawLayer();
    UI.drawLayer();
  }
  
}
