import "package:flutter/material.dart";
import './homePage.dart';
import 'package:math_expressions/math_expressions.dart';


void main() => runApp(new CalculatorApp());

class CalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
        home: new HomePage(), 
    );
  }

}