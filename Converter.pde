class Converter{
  Converter(){}
  
  // Consepts:
  // Context-free grammar
  // Lexical analysis
  // Interpreter (computing)
   
  Func convert(String input){
    return new JSEvaluator(input); // see comment above JSEvaluator in Func
  }
}


class ConverterTester{
  Converter con = new Converter(); 

  void test(){
    println(con.convert("73/7").call(0),10.42);
    
    println(con.convert("8").call(0),8);
    println(con.convert("8.8").call(0),8.8);
    println(con.convert("-8.8").call(0),-8.8);
    
    println(con.convert("8.8 + 5").call(0),13.8);
    println(con.convert("8.8 - 5").call(0),3.8);
    
    
    println(con.convert("3x").call(5),15);
    println(con.convert("3x+0").call(5),15);
    println(con.convert("3*x+0").call(5),15);
    println(con.convert("x*3+0").call(5),15);
    println(con.convert("3x+5").call(5),20);
    println(con.convert("3x-5").call(5),10);
   
    println(con.convert("10*8").call(0),80);
    
    println(con.convert("10*8*x").call(1),80);
    
  }

}
