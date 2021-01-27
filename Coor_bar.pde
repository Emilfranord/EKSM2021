class Coor_bar {

  float[] intervals;

  Coor_bar(float[] _intervals) {
    setOrigin(_intervals);
  }
  Coor_bar() {
    float[] defaultInterval = {-10.0, 10.0, -10.0, 10.0};
    setOrigin(defaultInterval);
  }

  void setOrigin(float[] inter) {
    this.intervals = inter;
  }  

  void render () {
    axis(this.intervals[0], this.intervals[1], this.intervals[2], this.intervals[3]);
  }

  void axis (float x_start, float x_end, float y_start, float y_end) {
    strokeWeight(1);
    if (x_start<=0 && x_end>=0) {
      float x_Coor = map(0, x_start, x_end, 0, width*0.8);
      line(x_Coor, 0, x_Coor, height);
      for (int i=0; i<= 20; i++) {
        line(x_Coor, i*height*0.8/20, x_Coor-10, i*height/20);
        strokeWeight(3); 
        if (x_start+i*(x_end-x_start)/20!=0.0) {
          fill(0); //farve 
          text(x_start+i*(x_end-x_start)/20, x_Coor-30, i*height*0.8/20);//y aksens tal
        }
      }
    } else {

      for (int i=0; i<= 20; i++) {
        line(width*0.2, i*height*0.8/20, width*0.2-10, i*height/20);
        strokeWeight(3); 
        fill(0); //farve 
        text(x_start+i*(x_end-x_start)/20, width*0.2-30, i*height*0.8/20);//y aksens tal
      }
    }

    strokeWeight(1);
    if (y_start<=0 && y_end>=0) {
      float y_Coor = map(0, y_start, y_end, 0, height*0.8);
      line(y_Coor, 0, y_Coor, width);
      for (int i=0; i<= 20; i++) {
        line(y_Coor, i*width*0.8/20, y_Coor-10, i*width/20);
        strokeWeight(3); 
        if (x_start+i*(y_end-y_start)/20!=0.0) {
          fill(0); //farve 
          text(y_start+i*(y_end-y_start)/20, y_Coor-30, i*width*0.8/20);//y aksens tal
        }
      }
    } else {

      for (int i=0; i<= 20; i++) {
        line(height*0.2, i*width*0.8/20, height*0.2-10, i*width/20);
        strokeWeight(3); 
        fill(0); //farve 
        text(y_start+i*(y_end-y_start)/20, height*0.2-30, i*width*0.8/20);//y aksens tal
      }
    }
  }

  void Gitter() {
    stroke(100); // farve
    for (int i=0; i<20; i++) {
      line(i*height/20, 0, i*height/20, width*0.8); //x aksen
      line(0, i*height/20, width*0.8, i*height/20);// y aksen
      //virker ikke - skal den være der?
    }
  }
  void mappedPoint(float realX, float realY) {
    mappedPoint(realX, realY, color(#778899));
  }

  void mappedPoint(float realX, float realY, color c) {
    float screenX = map(realX, this.intervals[0], this.intervals[1], 0, width*0.8);
    float screenY = map(realY, this.intervals[2], this.intervals[3], 0, height);

    strokeWeight(2);
    stroke(c);
    point(screenX, screenY);
  }

  void renderFunction(Func f, int lower, int upper, int jumpLength, color c) {
    for (int value = lower; value <= upper; value+=jumpLength) {
      mappedPoint(value, f.call(value), c);
    }
  }
}
