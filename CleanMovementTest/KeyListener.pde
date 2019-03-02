import java.util.LinkedList;

public class KeyListener {
  private HashMap<Integer,key> input = new HashMap<Integer,key>();

  // List used to determine which keys need to be updated.  Includes all keys from events.  Each key is removed from here once check is done.
  private LinkedList<key> updateKeys = new LinkedList<key>();

  // List used to determine which keys are listened to. Place new keycodes in here when you need to add new controls.
  private int[] events = { UP, DOWN, LEFT, RIGHT, 65, 68, 87, 83, 32};
  
  // Constructor stores all keys needed
  public KeyListener() {
    for(int i: events) {
      input.put(i, new key());
    }
  }
  
  // Checks all keys and sets them to PRESSED and subsequently HELD if they are pressed in void keyPressed() where type is set as true
  // Does the opposite in void keyReleased() where type is set as false
  public void keyUpdate(boolean type) {
    for(int i:events) {
      if(keyCode == i) {
        key currentKey = input.get(i);
        KeyState state = currentKey.getState();
        if(type) {
          if(state == KeyState.NOTHELD || state == KeyState.RELEASED) {
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
  
  // If any keys are being checked at all, retrieves and removes that key from the list and sets its state to HELD if it is pressed and NOTHELD if it is released.
  public void update() {
    while(updateKeys.size() > 0) {
      updateKeys.remove().update();
    }
  }
  
  // Returns true if the key is held. Uses keycode.
  public boolean isHeld(int item) {
    try {
      return input.get(item).getState() == KeyState.HELD;
    } catch (Exception e) {
      return false;
    }
  }
  
  // Uses characters(letters only) instead.
  public boolean isHeld(char item) {
    return isHeld((int) item - 32);//convert letter to keyCode
  }
  
  // Gets state of certain key. Uses keycode.
  public KeyState getState(int item) {
    try {
      return input.get(item).getState();
    } catch(Exception e) {
      return KeyState.NOTHELD;
    }
  }
  
  // Uses characters(letters only) instead.
  public KeyState getState(char item) {
    return getState((int) item - 32);
  }

  // Returns current input in string.
  @Override
  public String toString() {
    return input.toString();
  }
}

// States for key inputs.
public static enum KeyState {
    HELD,
    NOTHELD,
    PRESSED, // Only on first frame
    RELEASED
}

private class key {
  KeyState state = KeyState.NOTHELD;// Default
  
  // If the key is pressed, then it is in a state of being held, and if the key is released then it is in a state of not being held.
  // Is necessary because PRESSED and RELEASED are only one frame.
  public void update(){
    if(state == KeyState.PRESSED){
      state = KeyState.HELD;
    }
    if(state == KeyState.RELEASED){
      state = KeyState.NOTHELD;
    }
  }
  
  // Returns the state of the string.
  public KeyState getState() {
    return state;
  }
  
  // Articially sets the state of the key.
  public void setState(KeyState state) {
    this.state = state;
  }
  
  // Returns state of key in a string.
  @Override
  public String toString() {
    return state.toString();
  }

}
