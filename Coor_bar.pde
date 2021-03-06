class Coor_bar {

  float[] intervals;

  Coor_bar(float[] _intervals) {
    setOrigin(_intervals);
  }

  Coor_bar() {
    reset();
  }

  void setOrigin(float[] inter) {
    this.intervals = inter;
  }

  void reset() {
    float[] defaultInterval = {-10.0, 10.0, -10.0, 10.0};
    setOrigin(defaultInterval);
  }

  private void changeInterval(int direction, float value) { // imagine that private works
    // key for direction x_start, x_end,  y_start, y_end
    this.intervals[direction] +=value;
  }

  void changeInterval(Direction dir, float value) {
    switch(dir) {
    case X_START:
      changeInterval(0, value);
      break;
    case X_END:
      changeInterval(1, value);
      break;
    case Y_START:
      changeInterval(2, value);
      break;
    case Y_END:
      changeInterval(3, value);
      break;
    }
  }

  void render () {
    axis(this.intervals[0], this.intervals[1], this.intervals[2], this.intervals[3]);
  }
  int partition = 20; 

  void axis (float x_start, float x_end, float y_start, float y_end) {
    stroke(0);

    strokeWeight(1);

    float x_Coor = (width*0.8) / 2;
    line(x_Coor, 0, x_Coor, height);

    for (int i=0; i<= partition; i++) {
      line(x_Coor, i*height*0.8/partition, x_Coor-10, i*height/partition*0.8);
      strokeWeight(3); 

      fill(0); //farve 
      float label =+y_start+i*((y_end-y_start)/partition);
      text(round(label), x_Coor-30, (partition-i)*height*0.8/partition+7);//y aksens tal
    }

    strokeWeight(1);

    float y_Coor = height*0.8 /2;
    line(0, y_Coor, width*0.8, y_Coor);

    for (int i=0; i<= partition; i++) {
      line(i*width*0.8/partition, y_Coor, i*width/partition*0.8, y_Coor-10);
      strokeWeight(3); 

      fill(0, 0, 0); //farve 
      float label = x_start+i*(x_end-x_start)/partition;
      if (i != partition/2-1 || i != partition/2) {
        text(round(label), i*width*0.8/partition-2, y_Coor-15);//x aksens tal
      }
    }
  }

  void Gitter() {
    stroke(100); // farve
    strokeWeight(1); 
    for (int i=0; i<partition; i++) {
      line(i*height/partition*0.8, 0, i*height/partition*0.8, width*0.8); //x aksen
      line(0, i*height/partition*0.8, width*0.8, i*height/partition*0.8);// y aksen
    }
  }

  void mappedPoint(float realX, float realY) {
    mappedPoint(realX, realY, color(#778899));
  }

  void mappedPoint(float realX, float realY, color c) {
    float screenX = map(realX, this.intervals[0], this.intervals[1], 0, width*0.8 );
    float screenY = map(realY, this.intervals[2], this.intervals[3], height*0.8, 0);

    strokeWeight(2);
    stroke(c);
    point(screenX, screenY);
  }


  void mappedLine(float realX, float realY, float realXTwo, float realYTwo,  color c) {
    float screenX = map(realX, this.intervals[0], this.intervals[1], 0, width*0.8 );
    float screenY = map(realY, this.intervals[2], this.intervals[3], height*0.8, 0);

    float screenXTwo = map(realXTwo, this.intervals[0], this.intervals[1], 0, width*0.8 );
    float screenYTwo = map(realYTwo, this.intervals[2], this.intervals[3], height*0.8, 0);

    strokeWeight(2);
    stroke(c);
    line(screenX, screenY,screenXTwo, screenYTwo);
  }




  // the function that draws the dots. 
  void renderFunction(Func f, float lower, float upper, float jumpLength, color c) { 
    for (float value = lower; value <= upper; value+=jumpLength) {
      //mappedPoint(value, f.call(value), c);
      mappedLine(value, f.call(value),value+  jumpLength, f.call(value+jumpLength), c);
    }
  }

  void renderFunction(Func[] fs ) {
    for (Func q : fs) {
      renderFunction(q);
    }
  }

  void renderFunction(Func[] fs, color[] colors) throws IndexOutOfBoundsException {
    if (colors.length >= fs.length) {
      throw new IndexOutOfBoundsException();
    }
    int i = 0;
    for (Func q : fs) {
      renderFunction(q, colors[i]);
      i++;
    }
  }

  void renderFunction(Func f, color c) {
    renderFunction(f, (this.intervals[0]), (this.intervals[1]), 0.1, c);
  }

  void renderFunction(Func f) {
    color c = color(#0000ff); 
    renderFunction(f, c);
  }
}
