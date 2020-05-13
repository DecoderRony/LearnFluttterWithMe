import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class HomePage extends StatefulWidget{

 

  @override
  State createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
    String equation = "0";
    String result = "0";
    String expression = "";
    double equationFontSize = 38.0;
    double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "CLEAR"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "<"){
         equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0,equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){
         equationFontSize = 48.0;
        resultFontSize = 38.0;
        
        expression = equation;
        expression = expression.replaceAll('X', '*');
        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }
        catch(e){
          result = "Error";
        }
      }

      else{
         equationFontSize = 38.0;
        resultFontSize = 48.0;
        if(equation =="0"){
          equation = buttonText;
        }
        else{
          equation = equation + buttonText;
        }
      }
    });  


  }

  Widget button(String buttonText){
    return Expanded(
                child: MaterialButton(onPressed: () => buttonPressed(buttonText),
                child: Text(buttonText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
                color: Colors.white30,
                padding: const EdgeInsets.all(20),
                splashColor: Colors.teal,
                ),
            );
    
  }

  

  //BUTTON OF CALCULATOR


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.teal,
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 20
              ),
              child: Text(equation,
              style: TextStyle(
                fontSize: equationFontSize,
                fontWeight: FontWeight.bold
              ),
              ),
            ),

             Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Text(result,
              style: TextStyle(
                fontSize: resultFontSize,
                fontWeight: FontWeight.bold
              ),
              ),
            ),


            new Expanded(child: Container
            (
              padding: EdgeInsets.only(top: 155),
              child: Divider())),

            Row(
              children: <Widget>[
                button("7"),
                button("8"),
                button("9"),
                button("/")
              ],
            ),

            Row(
              children: <Widget>[
                button("4"),
                button("5"),
                button("6"),
                button("X")
              ],
            ),

            Row(
              children: <Widget>[
                button("1"),
                button("2"),
                button("3"),
                button("-")
              ],
            ),

            Row(
              children: <Widget>[
                button("."),
                button("0"),
                button("00"),
                button("+")
              ],
            ),

            Row(
              children: <Widget>[
                button("CLEAR"),
                button("="),
                button("<")
              ],
            ),
          ],
        ),
      ),
    );
  }
}