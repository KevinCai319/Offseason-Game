public abstract class Physical extends GameObject{
    PVector pos = new PVector(0,0);
    public Physical(PVector pos){
      this.pos = pos;
    }
    abstract void render();
}