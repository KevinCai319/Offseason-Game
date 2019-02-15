import java.util.LinkedList; 
public class KeyListener{
  private HashMap<Integer,key> input = new HashMap<Integer,key>();
  
  // List used to determine which keys need to be updated.
  private LinkedList<key> updateKeys = new LinkedList<key>();
  
  // List used to determine which keys are listened to.
  private int[] events = {UP,DOWN,LEFT,RIGHT,65};
  public KeyListener(){
    for(int i: events){
      input.put(i,new key());
    }
  }
  public void keyUpdate(boolean type){
    for(int i:events){
      if(keyCode == i){
        key currentKey = input.get(i);
        KeyState state = currentKey.getState();
        if(type){
          if(state == KeyState.NOTHELD || state == KeyState.RELEASED){
            currentKey.setState(KeyState.PRESSED); 
            updateKeys.add(currentKey);
          }
        }else{
          currentKey.setState(KeyState.RELEASED);
          updateKeys.add(currentKey);
        }
      }
    }
  }
  public void update(){
    while(updateKeys.size() > 0){
      updateKeys.remove().update();
    }
  }
  public boolean isHeld(int item){
    try{
      return input.get(item).getState() == KeyState.HELD;
    }catch (Exception e){
      return false;
    }
  }
  public KeyState getState(char item){
    try{
      return input.get((int) item - 32).getState();
    }catch(Exception e){
      return KeyState.NOTHELD;
    }
  }
  public boolean isHeld(char item){
    return isHeld((int) item - 32);//convert letter to keyCode
  }
  @Override
  public String toString(){
    return input.toString();
  }
}
public static enum KeyState{
    HELD,NOTHELD,PRESSED,RELEASED
}
private class key{
  KeyState state = KeyState.NOTHELD;
  public void update(){
    if(state == KeyState.PRESSED){
      state = KeyState.HELD;
    }
    if(state == KeyState.RELEASED){
      state = KeyState.NOTHELD;
    }
  }
  public KeyState getState(){
    return state;
  }
  public void setState(KeyState state){
    this.state = state;
  }
  @Override
  public String toString(){
    return state.toString();
  }
}