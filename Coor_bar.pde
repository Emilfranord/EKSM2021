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
  final int partitions = 20; 

    void axis (float x_start, float x_end, float y_start, float y_end) {
    strokeWeight(1);

    float x_Coor = (width*0.8) / 2; // map(0, x_start, x_end, 0, width*0.8);
    line(x_Coor, 0, x_Coor, height);
    for (int i=0; i<= 20; i++) {
      line(x_Coor, i*height*0.8/20, x_Coor-10, i*height/20*0.8);
      strokeWeight(3); 
      if (true || x_start+i*(x_end-x_start)/20!=0.0) {
        fill(0); //farve 
        float label =+y_start+i*((y_end-y_start)/20);
        text(round(label), x_Coor-30, (20-i)*height*0.8/20+7);//y aksens tal
      }
    }

    strokeWeight(1);

    float y_Coor = height*0.8 /2; //map(0, y_start, y_end, 0, height*0.8);
    line(0, y_Coor, width*0.8, y_Coor);
    for (int i=0; i<= 20; i++) {
      line(i*width*0.8/20, y_Coor, i*width/20*0.8, y_Coor-10);
      strokeWeight(3); 
      if (true ||x_start+i*(y_end-y_start)/20!=0.0) {
        fill(255, 0, 0); //farve 
        float label = x_start+i*(x_end-x_start)/20;
        text(round(label), i*width*0.8/20, y_Coor-30);//y aksens tal
      }
    }
  }

  void Gitter() {
    stroke(100); // farve
    for (int i=0; i<20; i++) {
      line(i*height/20*0.8, 0, i*height/20*0.8, width*0.8); //x aksen
      line(0, i*height/20*0.8, width*0.8, i*height/20*0.8);// y aksen
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
