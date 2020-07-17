import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/callscreen.dart';
import 'package:whatsapp_clone/pages/camerascreen.dart';
import 'package:whatsapp_clone/pages/chatscreen.dart';
import 'package:whatsapp_clone/pages/statusscreen.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
   void initState(){
     super.initState();
     _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CALLS",),

          ],

        ),

        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Icon(Icons.more_vert),
        ],
      ),

      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallScreen()
        ]),
      floatingActionButton: new FloatingActionButton(onPressed: (){},
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.message),
      ),
    );
  }
}