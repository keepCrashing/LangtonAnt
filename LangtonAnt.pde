import controlP5.*;
ControlP5 cp5;
Accordion accordion;
int WIDTH = 1400;
int HEIGHT = 1000;
int grid[][];
int scale = 5;
Ant ant;
Rule rule;

void setup(){
  surface.setSize(WIDTH, HEIGHT);
  surface.setLocation(0,0);
  surface.setAlwaysOnTop(true);
  background(255, 255, 255);
  gui();
  Playground playground = Playground.getInstance();
  playground.setWidth(WIDTH-400);
  playground.setHeight(HEIGHT);
  playground.init();

}
void draw(){
  Playground playground = Playground.getInstance();
  fill(255, 255, 255, 0);
  stroke(128);
  rect(0, 0, 1000, 1000);
  if(rule!=null)
    rule.exec();
  //for(int i = 0; i < playground.getGridPoints().length; i++){
  //  for(int j = 0; j < playground.getGridPoints()[0].length; j++){
  //    fill(255, 255, 255, 0);
  //    stroke(255, 0, 0, 55);
  //    rect(playground.getGridPoints()[i][j].getX(), playground.getGridPoints()[i][j].getY(), scale, scale);
  //    //println(playground.getGridPoints()[i][j].getX() + "      "+playground.getGridPoints()[i][j].getY());
  //  }
  //}
}
//void mousePressed(){
//   looping = !looping;
//}
void gui(){
  cp5 = new ControlP5(this);
  Group g1 = cp5.addGroup("ant")
  .setFont(createFont("arial",20))
                .setBackgroundColor(color(0,0,0))
                .setBackgroundHeight(200);
  cp5.addTextfield("rules").setPosition(10,20)
  .setSize(300,50)
  .setAutoClear(false)
  .setText("R L L R")
  .setFont(createFont("arial",20))
  .submit()
  .moveTo(g1);
  cp5.addButton("play").setPosition(10,100)
  .setFont(createFont("arial",20))
  .setSize(300,50)
  .moveTo(g1);
  accordion = cp5.addAccordion("acc")
                  .setPosition(1000,0)
                  .setWidth(400)
                  .addItem(g1);
  accordion.open(0);
}
void play(){
 //looping = !looping; 
 String strRule = cp5.get(Textfield.class, "rules").getText();
 ant = new Ant(100, 100);
 rule = new Rule(ant, strRule);
}
