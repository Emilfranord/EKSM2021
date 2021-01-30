// not a class, but a collection of processing functios.

enum Direction {
  X_START, 
    X_END, 
    Y_START, 
    Y_END;
}

void keyPressed() {
  if (key == 'w') { // move the Y axis two up
    C.changeInterval(Direction.Y_END, 2);
    C.changeInterval(Direction.Y_START, 2);
  }
  if (key =='z') { // zooms out by two
    C.changeInterval(Direction.Y_END, 2);
    C.changeInterval(Direction.Y_START, -2);

    C.changeInterval(Direction.X_END, 2);
    C.changeInterval(Direction.X_START, -2);
  }
}


void mousePressed() {
}


void mouseWheel(MouseEvent event) {
  if(event.getCount() > 0){
    key = 'z';
    keyPressed();
  }else{
    key = 'c';
    keyPressed();
  }

}
