import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png',
            height: 200,
            width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Welcome to Hogwarts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text("Hogwarts, the school of wizard and witchcraft led by Albus Dumbledore is a place where you can learn about magic and its uses. Hogwarts gained more popularity because of two of its greatest students Tom Riddle aka Voldemort and Harry Potter. Here you can know more about Hogwarts, it's clubs and play quizzes to test your knowledge about Hogwarts. Happy Playing...",
              style: TextStyle(
                height: 1.5,
                
              ),
              textAlign: TextAlign.center,
              ),
            ),

            RaisedButton(onPressed: (){Navigator.pushNamed(context, '/teams');}, child: Icon(Icons.arrow_right),)
          ],
        ),
      ),
      
    );
  }
}