import 'package:flutter/material.dart';


import 'package:quizappeasy/question.dart';

import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totscore = 0;

  void _answerQuestion(ans){
    if(ans == 'Gryffindor'){
      totalScore();
    }
    else if(ans == 'Albus Severus Dumbledore'){
      totalScore();
    }
    else if(ans == 'Nimbus 3000'){
      totalScore();
    }

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

//RESET FUNCTION
  void _reset(){
    setState(() {
      _questionIndex = 0;
      totscore = 0;
    });
  }

  void totalScore(){
    totscore += 2;
  }

//TOTAL SCORE GET METHOD


  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'question':'Best team of Hogwarts?',
        'answer': ['Slytherine','Gryffindor', 'Ravenclaw','Hufflepuf'],
      },

      {
        'question':'Name of Harry Potter\'s son?',
        'answer': ['Albus Snape Dumbledor','Albus Severus Snape', 'Severus Dumbledore','Albus Severus Dumbledore'],
      },

      {
        'question':'Malfoy\'s broomstick\'s model number is?',
        'answer': ['Nimbus 2000','Nimbus 2001', 'Nimbus 3000','Nimbus 4000'],
      },
    ];

    return MaterialApp(
      title: 'Quizify',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Quizify'),
        ),
        body: _questionIndex<3? Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Question(questions[_questionIndex]['question']),
            ),
            ...(questions[_questionIndex]['answer'] as List<String>).map((ans) {
              return Answer(() => _answerQuestion(ans), ans);
            }
            ).toList()

          ],
        ): Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Total Score: $totscore',style: TextStyle(fontSize: 28),),
              SizedBox(height:20),
              IconButton(icon: Icon(Icons.refresh), onPressed: _reset, iconSize: 40,),
            ],
          ),
        )
      ),
    );
  }
}