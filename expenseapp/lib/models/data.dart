import 'package:flutter/foundation.dart';

class Store {
  double price;
  var title;
  DateTime date;
  String iD;

  Store({
    @required this.price,
    @required this.title,
    @required this.date,
    @required this.iD,
  });
}
