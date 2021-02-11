class Converter {
  Converter() {
  }

  Func convert(String input) {
    if (input.contains("sin")) {
      input = input.replace("sin", "Math.sin");
    }

    if (input.contains("cos")) {
      input = input.replace("cos", "Math.cos");
    }

    if (input.contains("tan")) {
      input = input.replace("tan", "Math.tan");
    }

    // TODO: convert (a^b) to Math.pow(a,b) 
    if (input.contains("^")) {
      // find the index of hat, go from left to right and count the opening and closing parentheis
      // then find the relevant indexes and make the new input string. 
      
      int hatIndex = input.indexOf("^");
      int parenthesesCount = 0;
      int exponentEnd= input.length()+1;
      int rootStart = 0;
      for(int i = hatIndex+1;i<input.length() ;i++){
        if(input.charAt(i) == '('){parenthesesCount++;}
        if(input.charAt(i) == ')'){parenthesesCount--;}
        if(parenthesesCount == 0){exponentEnd = i; break;}
      }
      
      parenthesesCount = 0;
      for(int i = hatIndex-1;i >= 0 ;i--){
        if(input.charAt(i) == ')'){parenthesesCount++;}
        if(input.charAt(i) == '('){parenthesesCount--;}
        if(parenthesesCount == 0){rootStart = i; break;}
      }
      String exponent = input.substring(hatIndex+2, exponentEnd);
      String root = input.substring(rootStart+1,hatIndex-1);
      String combined = String.format("Math.pow(%s, %s)",root, exponent);
      input = input.substring(0,rootStart) + combined + input.substring(exponentEnd+1, input.length());
    }


    return new JSEvaluator(input); // see comment above JSEvaluator in Func
  }
}

class ConverterTester {
  Converter con = new Converter(); 

  void test() {
    println(con.convert("(4)^(2)").call(0), 16); // there must be parentheses around expressions with exponents
    //println(con.convert("4 ** 2").call(0), 16);
    //println(con.convert("4**2").call(0), 16);
    println(con.convert("Math.pow(4,2)").call(0), 16);
    println(con.convert("73/7").call(0), 10.42);
    println(con.convert("8").call(0), 8);
    println(con.convert("8.8").call(0), 8.8);
    println(con.convert("-8.8").call(0), -8.8);

    println(con.convert("8.8 + 5").call(0), 13.8);
    println(con.convert("8.8 - 5").call(0), 3.8);

    println(con.convert("3x").call(5), 15); // user must explicitly write * to multiply
    println(con.convert("3x+0").call(5), 15);
    println(con.convert("3*x+0").call(5), 15);
    println(con.convert("x*3+0").call(5), 15);
    println(con.convert("3x+5").call(5), 20); // user must explicitly write * to multiply
    println(con.convert("3x-5").call(5), 10);

    println(con.convert("8*(x+1)").call(2), 24);

    println(con.convert("10*8").call(0), 80);
    println(con.convert("10*8*x").call(1), 80);

    println(con.convert("cos(x)").call(2), -0.41614);
    println(con.convert("sin(x)").call(2), 0.9092);
    println(con.convert("tan(x)").call(2), -2.1850);
    
    println(con.convert("4^x").call(2), 0);
    println(con.convert("4^x").call(4), 0);
    println(con.convert("ln(9)").call(4), 0);
    println(con.convert("x^-5").call(4), 0);
    println(con.convert("x^x").call(4), 0);
    println(con.convert("x^(4*(x-1))").call(4), 0);
  }
}
