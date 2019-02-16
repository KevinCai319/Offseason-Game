public class Player extends Viewable {
    
    public Player(PVector pos) {
      super(pos);
    }
    
    void render() {
      rect(pos.x,pos.y,100,100);
    }
    
    void update() {
      pos.x += 0.1;
    }
    
}
