import "package:flutter/material.dart";
// import "./loginpage.dart";
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: new LoginPage(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 179, 255, 1),
      ),
    );
  }
}


class LoginPage extends StatefulWidget{
  @override
  State createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  with SingleTickerProviderStateMixin{
  AnimationController _iconController;
  Animation<double> _icon;
  @override
  void initState(){
    super.initState();
    _iconController = new AnimationController(vsync: this,
    duration: Duration(milliseconds: 500)
    );

    _icon = new CurvedAnimation(parent: _iconController, curve: Curves.easeOut);

    _icon.addListener(() => this.setState((){}));
    _iconController.forward();
    
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/google2.png"),
            fit: BoxFit.cover,
            color: Color.fromRGBO(0, 0, 0, 0.6),
            colorBlendMode: BlendMode.darken,
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/google.png'),
                width: _icon.value * 100,
              
              ),
              
              new Form(
                child: new Theme(data: new ThemeData(
                  brightness: Brightness.dark, primarySwatch: Colors.red,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                    )
                  )),

                  child: Container(
                    padding: const EdgeInsets.all(20),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter you Email"
                      ),
                    ),

                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter you Email"
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top:20)),
                    new MaterialButton(onPressed: (){},
                      color: Colors.teal,
                      textColor: Colors.white,
                      height: 40,
                      minWidth: 100,
                      splashColor: Colors.blue,
                      child: Text("Login"),
                    )
                  ],
                ),
                  ),
              ),
                ),
            ],
          ),
        ],
      )
      );
  }
}

