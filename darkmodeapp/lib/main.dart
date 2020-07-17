import 'package:darkmodeapp/product.dart';
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'appDrawer.dart';
import 'edit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var details = new Map();
  var products = new List();
  void addProduct(){
    products.add(details);
  }
  bool darkmode = false;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkmode ? ThemeData.dark():ThemeData.light(),
      title: 'Dark Mode Test',
      //ROUTES 
     
      home: HomePage(),
       routes: {
        '/home':(context)=>MyApp(),
        '/edit':(BuildContext context)=>EditScreen(details),
      },
      
      onGenerateRoute: (settings) {
        if(settings.name == ProductBuilder.routename){
          return MaterialPageRoute(
            builder: (context){
              return ProductBuilder(details,products,addProduct)
              ;
            });
        }
        else
          return null;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: apBar(),
         drawer: Drawr(),
        body: Center(
          child: Text('Hey There'),
        ),
      );
  }
}

