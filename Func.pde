interface Func {
  float call(float x); // returns f(x) in math terminology
}

class LinearEquation implements Func {
  float slope;
  float yIntercept;

  LinearEquation(float _slope, float _yInter) {
    this.slope = _slope;
    this.yIntercept = _yInter;
  }
  
  float call(float x){
    return slope * x + yIntercept;
  }
}

class MultiFunctor implements Func{
  // Take a Fuct[] and handel it as a singe functor
  // example is f(x) = 8x + sin(x) + 8x^2
  // That consists of three diffrent Functors in a chain
  
  float call(float x){
    //TODO: implement this
    return 0;
  }
}
