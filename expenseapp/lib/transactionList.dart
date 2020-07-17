import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/data.dart';

class TransactionList extends StatelessWidget {
  final List<Store> transactions;
  final Function _deleteTransaction;
  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${transactions[index].price.toString()}',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 20),
                  fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              DateFormat('dd/MM/YYYY').format(transactions[index].date),
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => _deleteTransaction(transactions[index].iD)),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
