public static class Point{
  private float x, y, z;
  Point(){}
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  Point(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  public void setX(float x){
    this.x = x;
  }
  public void setY(float y){
    this.y = y;
  }
  public void setZ(float z){
    this.z = z;
  }
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getZ(){
    return z;
  }
}
