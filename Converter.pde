class Converter{
  Converter(){}
  
  
  Func convert(String input){
    // PEMDAS
    // number becomes number, add and sub, mult and devi, exponents, parentheses 
   
    // clean and sanitise the input
    input = input.replace(" ", "");
    Func output = null; 
    
    
    // convert string number to float numbers
    try{
      return new Constant(Float.parseFloat(input));
    }catch(Exception e){
    
    }
    
    // handle
    
    
    // handle add and sub
    input = input.replace("-", "&-").replace("+", "&+");
    String[] seperateInput = input.split("&");
    
    Func[] elements = new Func[seperateInput.length];
    for(int i = 0;i<elements.length && elements.length != 1 ; i++){
      elements[i] = convert(seperateInput[i]);  
    }
    output = new MultiFunctor(elements);
    
    
    return output;
  }

}


class ConverterTester{
  Converter con = new Converter(); 

  void test(){
    println(con.convert("8").call(0),8);
    println(con.convert("8.8").call(0),8.8);
    println(con.convert("-8.8").call(0),-8.8);
    
    println(con.convert("8.8 + 5").call(0),13.8);
    println(con.convert("8.8 - 5").call(0),3.8);
    
    println(con.convert("10*8").call(0),80);
    
    println(con.convert("3x").call(5),15);
    println(con.convert("3x+0").call(5),15);
    println(con.convert("3x+5").call(5),20);
    println(con.convert("3x-5").call(5),10);
    
  }

}
