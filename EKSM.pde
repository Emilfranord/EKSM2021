import controlP5.*;

Coor_bar C = new Coor_bar();
Converter conver = new Converter();
Func tes;
void setup() {  
  size(800, 800);
  //ConverterTester t = new ConverterTester();
  //t.test(); // comment this line to prevent testing

  tes = conver.convert("1*x+5");
}

void draw() {
  background(255);
  C.Gitter();
  C.render();
  C.renderFunction(tes, color(#ff0000));
  
}

void mousePressed() {
  float[] temp = {-5, 15, -5, 15};
  C.setOrigin(temp);
}
