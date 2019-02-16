public class GameLayer {
  private ArrayList<GameObject> objects = new ArrayList<GameObject>();
  PVector translation = new PVector(0,0);

  public GameLayer() {

  }

  public GameLayer(PVector translation) {
    this.translation = translation;
  }

  public void drawLayer() {
    pushMatrix();
    translate(translation.x,translation.y);
    for(GameObject i:objects) {
      i.update();
    }
    popMatrix();
  }

  public void add(Object item) {
    try {
      objects.add((GameObject) item);
    } catch(Exception e) {
      println("ERROR: added wrong Object type in list");
      throw e;
    }
  }

  public void shiftTranslation(PVector shift) {
    translation.add(shift);
  }

}
