import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

 

  @override
  State createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
    double num1=0, num2=0, sum=0;
    final TextEditingController t1 = new TextEditingController(text: "0");
      final TextEditingController t2 = new TextEditingController(text: "0");

  void doAdd(){
    this.setState((){
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 + num2;
    });
  }

   void doSub(){
    this.setState((){
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 - num2;
    });
  }

   void doMul(){
    this.setState((){
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 * num2;
    });
  }

   void doDiv(){
    this.setState((){
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context){
    Color c2 = Colors.blue;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GATE Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("OUTPUT: $sum",
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            new TextField(
              keyboardType: TextInputType.number,
             decoration: InputDecoration(
                hintText: "Enter 1st number",
              ),
              controller: t1,
            ),

             new TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter 2nd number",
              ),
              controller: t2,
            ),
          new Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
            new MaterialButton(onPressed: doAdd,
              child: new Text("+"),
              color: Colors.blue,
            ),
            new MaterialButton(onPressed: doSub,
              child: new Text("-"),
              color: Colors.blue,
            ),
            ],
          ),
          
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            new MaterialButton(onPressed: doMul,
              child: new Text("X"),
              color: Colors.blue,
            ),
            
           new MaterialButton(onPressed: doDiv,
              child: new Text("/"),
              color: Colors.blue,
            ),
            ],
          )
          ],
        ),
      ),
      );
  }
}