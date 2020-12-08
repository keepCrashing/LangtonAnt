public class Rule{
  Ant ant;
  String rule;
  String[] rules;
  float[] angles;
  color[] colors;
  public Rule(Ant ant, String rule){
    rules = split(rule, " ");
    this.ant = ant;
    this.angles = new float[rules.length];
    this.colors = new color[rules.length];
    for(int i = 0; i < rules.length; i++){
      if(rules[i].equals("L")){
        this.angles[i] = -90;
      }
      else if (rules[i].equals("R")){
        this.angles[i] = 90;
      }else if (rules[i].equals("N")){
        this.angles[i] = 0;
      }
    }
    for(int i = 0; i < this.rules.length; i++){
      color c = color(random(255), random(255), random(255));
      colors[i] = c;
    }
  }
  public float[] getAngles(){
    return this.angles;
  }
  public String[] getRules(){
    return this.rules;
  }
  public void exec(){
    Playground playground = Playground.getInstance();
    for(int i = 0; i < angles.length; ++i){
       if(playground.getGrid(ant.getX(),ant.getY()) == i){
        ant.turn(angles[i]);
        int gridState = i+1;
        if(gridState == angles.length)gridState = 0;
        playground.setGrid(ant.getX(), ant.getY(), gridState);
        fill(colors[i]);
        noStroke();
        rect(playground.getPoint(ant.getX(), ant.getY()).getX(),playground.getPoint(ant.getX(), ant.getY()).getY(), scale, scale);
        ant.moveForward(1);
      }
    }
  }
}
