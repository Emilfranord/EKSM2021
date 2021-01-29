import controlP5.*;

Coor_bar C = new Coor_bar();
ControlP5 cp5;
void setup() {  
  size(800, 800);
  //ConverterTester t = new ConverterTester();
  //t.test(); // comment this line to prevent testing
  PFont font= createFont("arial", 35);
  cp5 = new ControlP5(this);
  cp5.addTextfield("input")
    .setPosition(width*0.8, 10)
    .setSize(round(0.2*width), 150)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));


  cp5.addBang("clear")
    .setPosition(width*0.8, 200)
    .setSize(round(0.2*width), 150)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
}

void draw() {
  background(255);
  //C.Gitter();
  C.render();
  
  
}

void mousePressed() {
  float[] temp = {40, 80, 50, 70};
  C.setOrigin(temp);
}
