import 'package:darkmodeapp/appBar.dart';
import 'package:flutter/material.dart';

import 'appDrawer.dart';

class EditScreen extends StatefulWidget {
  var details = new Map();
  EditScreen(this.details);
  @override
  _EditScreenState createState() => _EditScreenState(details);
}

class _EditScreenState extends State<EditScreen> {
  var details = new Map();
  _EditScreenState(this.details);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apBar(),
       drawer: Drawr(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Item Name',
                    labelText: 'Item Name',
                    border: OutlineInputBorder()
                  ),
                  onChanged: (String value){
                    details['name'] = value;
                  },
                ),
                SizedBox(height: 20),

                 TextField(
                   keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Price',
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                   onChanged: (String value){
                    details['price'] = value;
                  },
                 
                ),

                SizedBox(height: 20),

                MaterialButton(onPressed: (){
                  Navigator.pushNamed(context, '/product',arguments: details);
                },
                 child: Text('Add Product'),color: Colors.blue[400]),
              ],
            ),
          ),
        ),
      )
    );
  }
}