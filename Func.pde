interface Func {
  float call(float x); // returns f(x), in math terminology
}

// Note:
// This is a functor class that can be called, and in constructed with the input string as its only parameter.
// Like all other functors, it can be called and evaluated at x values.
// This is slower, computationaly, in the long run, but it allows us to progress, because we got stuck with parsing.

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

// inspired by https://stackoverflow.com/questions/41532497/how-to-convert-string-to-function-in-java
class JSEvaluator implements Func {
  ScriptEngineManager manager = new ScriptEngineManager();
  ScriptEngine engine = manager.getEngineByName("js");
  Object result = null;

  String expression;
  JSEvaluator(String _expression) {
    this.expression = _expression;
  }

  float call(float x) {
    String tempExpress = expression.replace("x", Float.toString(x));
    Object result = null;
    try {
      result = engine.eval(tempExpress);
    } 
    catch(Exception e) {
      print(e);
    }
    if (result != null ) {
      try {
        int temp = (int) result; 
        return temp;
      }
      catch(Exception e) {
        //print(e);
      }
    }

    if (result != null ) {
      Double temp = (Double) result; 
      return temp.floatValue();
    } else {
      return 0;
    }
  }
}


class LinearEquation implements Func {
  float slope;
  float yIntercept;

  LinearEquation(float _slope, float _yInter) {
    this.slope = _slope;
    this.yIntercept = _yInter;
  }

  float call(float x) {
    return slope * x + yIntercept;
  }
}

class Constant implements Func {
  float yIntercept;

  Constant(float  _yInter) {
    this.yIntercept = _yInter;
  }

  float call(float x) { // x is not used on purpose. 
    return yIntercept;
  }
}

class MultiFunctor implements Func {
  // Take a Fuct[] and handel it as a singe functor
  // example is f(x) = 8x + sin(x) + 8x^2
  // That consists of three diffrent Functors in a chain

  Func[] elements;

  MultiFunctor(Func[] _elements) {
    this.elements = _elements;
  }

  float call(float x) {
    float sum = 0;
    for (Func q : this.elements) {
      sum += q.call(x);
    }
    return sum;
  }
}

class scaledFunc implements Func {
  // equivalent to a*f(x)

  float scale;
  Func function;

  scaledFunc(float _scale, Func _f) {
    this.scale = _scale;
    this.function = _f;
  }

  float call(float x) {
    return scale * this.function.call(x);
  }
}
