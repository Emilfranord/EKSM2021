class Coor_bar {

 Coor_bar() {
   
  }  
  
  void axis () {
  //Streger
  for (int i=0; i<= 20; i++) {
    line(i*width*0.8/20, height/2, i*width*0.8/20, height/2+10);
    line(height/2, i*width*0.8/20, height/2-10, i*width/20);
    strokeWeight(3);
    //Tal
    strokeWeight(1);
    if (i!=10) {
      fill(0); //farve 
      text(i*10-100, i*width*0.8/20, height/2+30);//x aksens tal
      text(100-i*10, height/2-30, i*width*0.8/20);//y aksens tal
    }
  }
}

void Gitter() {
  stroke(100); // farve
  for (int i=0; i<20; i++) {
    line(i*height/20, 0, i*height/20, width*0.8); //x aksen
    line(0, i*height/20, width*0.8, i*height/20);// y aksen
  }
}

void setOrigin(){

}

}
