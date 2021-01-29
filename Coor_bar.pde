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
      if (i != partition/2-1 || i != partition/2){
        text(round(label), i*width*0.8/partition, y_Coor-30);//y aksens tal
      }
    }
  }

  void Gitter() {
    stroke(100); // farve
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

  void renderFunction(Func f, float lower, float upper, float jumpLength, color c) {
    for (float value = lower; value <= upper; value+=jumpLength) {
      mappedPoint(value, f.call(value), c);
    }
  }

  void renderFunction(Func f, color c) {
    renderFunction(f, (this.intervals[0]), (this.intervals[1]), 0.01, c);
  }

  void renderFunction(Func f) {
    color c = color(#0000ff); 
    renderFunction(f, c);
  }
}
