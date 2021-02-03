import controlP5.*;

Coor_bar C = new Coor_bar();

ControlP5 cp5;

Converter conver = new Converter();
Func tes;

String F;

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


  cp5.addBang("Enter")
    .setPosition(width*0.8, 150)
    .setSize(round(0.2*width), 75)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    
    cp5.addBang("Clear")
    .setPosition(width*0.8, 240)
    .setSize(round(0.2*width), 75)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);


  tes = conver.convert("1*x+5");

}

void Enter() {
  print("the following text was submitted :");
  F = cp5.get(Textfield.class,"input").getText();
  print(" textInput 1 = " + F);
  println();
}

void Clear() {
  cp5.get(Textfield.class,"input").clear();
  F="";
  println(F);
}

void draw() {
  background(255);
  C.Gitter();
  C.render();

  C.renderFunction(tes, color(#ff0000));
  
}
