public static class CoolVector{
   public static double getAngle(PVector p_1, PVector p_2) {
    double dy = (p_1.y - p_2.y);
    double dx = (p_2.x - p_1.x);
    double result = Math.toDegrees(Math.atan2(dy, dx)); 
    return (result < 0) ? (360 + result) : result;
  }
  
  public static double getAngle(PVector p_1) {
    double result = Math.toDegrees(Math.atan2(p_1.y, -p_1.x)); 
    return (result < 0) ? (360 + result) : result;
  }
}
