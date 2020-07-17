import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Portfolio",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                  ),

                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54
                        ),
                        height: 700,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text("Hey There", style: TextStyle(color: Colors.white),textAlign: TextAlign.right,),
                                Text("This is Arpit", style: TextStyle(color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[300]
                        ),
                        height: 700,
                      ),
                    ],
                  )


                ),

           
    );
  }
}