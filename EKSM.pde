import controlP5.*;

Coor_bar C = new Coor_bar();

void setup() {  
  size(800, 800);
  //ConverterTester t = new ConverterTester();
  //t.test(); // comment this line to prevent testing
}

void draw() {
  background(255);
  //C.Gitter();
  C.render();
}

void mousePressed(){
  float[] temp = {40, 80, 50, 70};
  C.setOrigin(temp);
}
