import 'package:flutter/material.dart';

class ProductBuilder extends StatefulWidget {
  static const routename = '/product';
  var details = new Map();
  var products = new List();
  var addProduct;
  ProductBuilder(this.details,this.products,this.addProduct);
  @override
  _ProductBuilderState createState() => _ProductBuilderState(details,products);
}

class _ProductBuilderState extends State<ProductBuilder> {
  var details = new Map();
  var products = new List();
  _ProductBuilderState(this.details,this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Text(details['name'])),
                  ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}