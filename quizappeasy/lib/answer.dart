import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _questionChanger;
  final ans;

  Answer(this._questionChanger, this.ans);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(ans),
        onPressed: _questionChanger,
      ),
    );
  }
}