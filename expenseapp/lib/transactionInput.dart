import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataInput extends StatefulWidget {
  final Function addToList;
  DataInput(this.addToList);

  @override
  _DataInputState createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();
  DateTime storeDate;

  void _checkValidation() {
    var title = titleController.text;
    var price = double.parse(priceController.text);

    if (title.isEmpty || price <= 0 || price == null || storeDate == null)
      return;

    widget.addToList(title, price, storeDate);
  }

  void _showDatePick() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        storeDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => _checkValidation,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
              controller: priceController,
              onSubmitted: (_) => _checkValidation,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                storeDate == null
                    ? Expanded(
                        child: Text(
                          'No Date Selected',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : Expanded(
                        child: Text(
                            'Picked Date: ${DateFormat.yMd().format(storeDate)}'),
                      ),
                FlatButton(
                    onPressed: _showDatePick,
                    child: Text(
                      'Pick a Date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RaisedButton(
              onPressed: () {
                _checkValidation();
                Navigator.pop(context);
              },
              color: Theme.of(context).accentColor,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
