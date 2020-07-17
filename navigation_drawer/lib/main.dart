
import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
           home: HomePage(),

      routes: {
        '/about':(context)=>About(),
      },
    );
  }
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Devfest',
  
                style: TextStyle(
  
                  fontSize: 24,
  
                ),
  
                ),
],
              ),
            ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: (){},
              ),

              ListTile(
                leading: Icon(Icons.location_searching),
                title: Text('About'),
                onTap: (){
                  Navigator.pushNamed(context, '/about');
                },
              ),
          ],
        ),
      ),

      body: Center(
        child:Text('DEVFEST 2021')
        )
    );
  }
}

//ABOUT PAGE
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('About Page'),
      ),
    );
  }
}