import "package:flutter/material.dart";
import './homePage.dart';

void main() => runApp(new CalculatorApp());

class CalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "GATE Calculator",
        home: new HomePage(), 
    );
  }

}