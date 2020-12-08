public class Ant{
  private Point point;
  private int x,y;
  private float angle = 0;
  public Ant(Point point){
    this.point = point;
  }
  public Ant(int x, int y){
    this.x = x;
    this.y = y;
  }
  public void setX(int x){
    this.x = x;
  }
  public void setY(int y){
    this.y = y;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public void setPoint(Point point){
    this.point = point;
  }
  public void turn(float deltaAngle){
    this.angle = (angle + deltaAngle)%360;
  }
  public void moveForward(int offset){
    Playground playground = Playground.getInstance();
    x = x + offset*(int)cos(radians(angle));
    if(x > playground.getCols() - 1){
      x = 0;
    }else if(x < 0){
      x = playground.getCols() - 1;
    }
    y = y + offset*(int)sin(radians(angle));
    if(y > playground.getRows() - 1){
      y = 0;
    }else if(y < 0){
      y = playground.getRows() - 1;
    }
    //println("x: " + x + " " + "y: " + y);
  }
  public void exec()
  {
    Playground playground = Playground.getInstance();
    while(x > 0 && x < playground.getCols() && y > 0 && y < playground.getRows()){
      if(playground.getGrid(x,y) == 0){
        turn(90);
        playground.setGrid(x,y,1);
        fill(0,0,0);
        rect(playground.getPoint(x, y).getX(),playground.getPoint(x, y).getY(), 20, 20);
        moveForward(1);
      }
      else if(playground.getGrid(x,y) == 1){
        turn(-90);
        playground.setGrid(x,y,0);
        fill(255,255,255);
        rect(playground.getPoint(x, y).getX(),playground.getPoint(x, y).getY(), 20, 20);
        moveForward(1);
      }
    }
  }

}
