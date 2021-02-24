// not a class, but a collection of processing functios.
// the tab has been made to section off the coordinate movement system. 
// Processing will not allow mouseDragged or mouseWheel to be defined inside a diffrent object,
// so it is instead defined here.

enum Direction {
  X_START, 
    X_END, 
    Y_START, 
    Y_END;
}

final int MOVEMENT_AMOUNT = 1;

// use the mouse for everything. do not use any keybord input for anything. 
void mouseDragged(MouseEvent event) {
  if (frameCount % 10 == 0 ) {
    PVector mouseDirection = new PVector(mouseX - pmouseX, mouseY - pmouseY);
    // four caseses for x, and 
    if (mouseDirection.y >0 ) {
      C.changeInterval(Direction.Y_END, MOVEMENT_AMOUNT);
      C.changeInterval(Direction.Y_START, MOVEMENT_AMOUNT);
    }

    if (mouseDirection.y <0 ) {
      C.changeInterval(Direction.Y_END, -MOVEMENT_AMOUNT);
      C.changeInterval(Direction.Y_START, -MOVEMENT_AMOUNT);
    }

    if (mouseDirection.x <0 ) {
      C.changeInterval(Direction.X_END, MOVEMENT_AMOUNT);
      C.changeInterval(Direction.X_START, MOVEMENT_AMOUNT);
    }

    if (mouseDirection.x >0 ) {
      C.changeInterval(Direction.X_END, -MOVEMENT_AMOUNT);
      C.changeInterval(Direction.X_START, -MOVEMENT_AMOUNT);
    }
  }
}

void mouseWheel(MouseEvent event) {
  if (event.getCount() > 0) {
    C.changeInterval(Direction.Y_END, MOVEMENT_AMOUNT);
    C.changeInterval(Direction.Y_START, -MOVEMENT_AMOUNT);

    C.changeInterval(Direction.X_END, MOVEMENT_AMOUNT);
    C.changeInterval(Direction.X_START, -MOVEMENT_AMOUNT);
  } else {
    C.changeInterval(Direction.Y_END, -MOVEMENT_AMOUNT);
    C.changeInterval(Direction.Y_START, MOVEMENT_AMOUNT);

    C.changeInterval(Direction.X_END, -MOVEMENT_AMOUNT);
    C.changeInterval(Direction.X_START, MOVEMENT_AMOUNT);
  }
}

//void keyPressed() {
//  if (key == 'w') { // move the Y axis two up
//  }
//  if (key == 's') { // move the Y axis two up
//    C.changeInterval(Direction.Y_END, -MOVEMENT_AMOUNT);
//    C.changeInterval(Direction.Y_START, -MOVEMENT_AMOUNT);
//  }
//}
