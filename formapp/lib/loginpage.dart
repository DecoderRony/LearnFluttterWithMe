import "package:flutter/material.dart";

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

    _icon = new CurvedAnimation(parent: _iconController, curve: Curves.bounceOut);

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
              // new Image(
                // image: new AssetImage('assets/google.png'),
                // width: _icon.value * 100,
                new FlutterLogo(
                  size:  100,
                ),
              // ),
            ],
          ),
        ],
      )
      );
  }
}