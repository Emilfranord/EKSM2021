import controlP5.*;
import java.util.ArrayList;

Coor_bar C = new Coor_bar();

ControlP5 cp5;

SQLite db;

Converter conver = new Converter();
ArrayList<Func> funcs = new ArrayList<Func>();
String F;

//TODO: make real db system

void setup() {  
  size(800, 800);

  //ConverterTester t = new ConverterTester();
  //t.test(); // comment this line to prevent testing

  db= new SQLite(this, "EKSM.db");
  assert db.connect():
  "Connection failed";

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
}

void draw() {
  background(255);
  C.Gitter();
  C.render();
  C.renderFunction(funcs.toArray(new Func[0]));
}

void Enter() {
  F = cp5.get(Textfield.class, "input").getText();
  if (F.length() != 0){
    Func temp = conver.convert(F);
    funcs.add(temp);
    writeDatabase(temp);
    cp5.get(Textfield.class, "input").clear();
    F="";
  }
}

void Clear() {
  clearLines();
  C.reset();
}

void clearLines() {
  funcs = new ArrayList<Func>();
}

void keyPressed() {
  // makes the enter button on the keybord have the same functionality as the Enter button on the UI.
  if (key == ENTER) { 
    Enter();
    key = ' ';
  }
}
