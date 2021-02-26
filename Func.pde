interface Func {
  float call(float x); // returns f(x), in math terminology
}

// Note:
// This is a functor class that can be called, and in constructed with the input string as its only parameter.
// Like all other functors, it can be called and evaluated at x values.
// This is slower, computationaly, in the long run, but it allows us to progress, because we got stuck with parsing.
// The propper solution would take too much time to implement.    

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

// inspired by https://stackoverflow.com/questions/41532497/how-to-convert-string-to-function-in-java
class JSEvaluator implements Func {
  ScriptEngineManager manager = new ScriptEngineManager();
  ScriptEngine engine = manager.getEngineByName("JavaScript");
  Object result = null;

  HashMap<Float, Float> lookupTable = new HashMap<Float, Float>();
  // Storage system for x's and their mapped values after evaluation.

  String expression;
  JSEvaluator(String _expression) {
    this.expression = _expression;
  }

  String toString() {
    return this.expression;
  }

  float call(float x) {
    // The number might have been found before. Therefore valued (x, f(x)) are stored in RAM for faster evaluation 
    // Dynamic programming.
    if (lookupTable.containsKey(x)) {
      return lookupTable.get(x);
    }

    // If we have not found the number before, solve for it 
    String tempExpress = this.expression.replace("x", Float.toString(x));
    Object result = null;
    try {
      result = engine.eval(tempExpress); // make JS evaluate the expression. If it fails the error is caught. 
    } 
    catch(Exception e) {
      print(e);
    }
    if (result != null) { // if the error was caught the object has no value, and it cannot be converted into a number. 
      try { // if it is a integer convert it to that and return, else do nothing.
        int temp = (int) result; 
        lookupTable.put(x, (float) temp);
        return temp;
      }
      catch(Exception e) {
        //print(e);
      }
    }
    if (result != null) { // if it was not a integer, try to turn it int a duble, else return 0.
      Double temp = (Double) result;
      lookupTable.put(x, temp.floatValue());
      return temp.floatValue();
    } else {
      return 0;
    }
  }
}

// Unnessesary becaus of the change to JSEvaluator
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
