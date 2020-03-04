import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions
            .map((e) => Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.deepPurple, width: 3),
                        ),
                        child: Text(
                          "\$${e.amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            e.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(e.date)),
                        ],
                      ),
                    ],
                  ),
                ))
            .toList());
  }
}
