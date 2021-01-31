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
    

    return new JSEvaluator(input); // see comment above JSEvaluator in Func
  }
}

class ConverterTester {
  Converter con = new Converter(); 

  void test() {
    println(con.convert("4 ** 2").call(0), 16);
    println(con.convert("Math.pow(4,2)").call(0), 16);
    println(con.convert("73/7").call(0), 10.42);
    println(con.convert("8").call(0), 8);
    println(con.convert("8.8").call(0), 8.8);
    println(con.convert("-8.8").call(0), -8.8);

    println(con.convert("8.8 + 5").call(0), 13.8);
    println(con.convert("8.8 - 5").call(0), 3.8);

    println(con.convert("3x").call(5), 15);
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
  }
}
