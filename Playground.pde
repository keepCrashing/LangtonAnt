public static class Playground{
  private static Playground instance = null;
  private int cols, rows;
  private int grid[][];
  private int scale = 5;
  private Point[][] gridPoints;
  private Playground(){}
  private int w,h;
  public void setWidth(int w){
    this.w = w;
    this.cols = w/scale;
  }
  public void setHeight(int h){
    this.h = h;
    this.rows = h/scale;
  }
  public void init(){
    gridPoints = new Point[cols][rows];
    grid = new int[cols][rows];
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows; j++){
        float x = i * scale;
        float y = j * scale;
        grid[i][j] = 0;
        gridPoints[i][j] = new Point(x,y);
      }
    }
  }
  public void setGrid(int i, int j, int num){
    grid[i][j] = num;
  }
  public int getGrid(int i, int j){
    return grid[i][j];
  }
  public Point getPoint(int x, int y){
    return gridPoints[x][y];
  }
  public Point[][] getGridPoints(){
    return this.gridPoints;
  }
  public int getCols(){
    return this.cols;
  }
  public int getRows(){
    return this.rows;
  }
  public static Playground getInstance(){
    if(instance == null){
      instance = new Playground();
    }
    return instance;
  }
}
