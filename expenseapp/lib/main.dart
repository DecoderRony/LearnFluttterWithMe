import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chart.dart';
import 'models/data.dart';
import './transactionInput.dart';
import './transactionList.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purple[700],
      ),
      title: 'Flutter App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Store> _transactions = [];

  void _addToList(String tx, double price, DateTime date) {
    final newAmount = Store(
      title: tx,
      price: price,
      date: date,
      iD: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newAmount);
    });
  }

  void _deleteTransaction(String iD) {
    setState(() {
      _transactions.removeWhere((element) => element.iD == iD);
    });
  }

  List<Store> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _inputModa(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return DataInput(_addToList);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Personal Expense',
        style: GoogleFonts.montserrat(),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.4,
              child: Chart(_recentTransactions)),
          Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              child: TransactionList(_recentTransactions, _deleteTransaction)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _inputModa(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
