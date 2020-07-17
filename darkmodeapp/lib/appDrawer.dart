import 'package:flutter/material.dart';

class Drawr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 30),
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: (){
                  Navigator.popAndPushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Add Products'),
                onTap: (){
                  // Navigator.pushNamed(context, '/edit');
                  Navigator.popAndPushNamed(context, '/edit');
                },
              )
            ],
          ),          
        );
  }
}