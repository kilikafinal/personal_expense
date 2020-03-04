import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/widget/transaction_list.dart';
import 'package:personal_expense/widget/user_transaction.dart';

import 'model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my App",
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app bar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              child: Text("hello!"),
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          UserTransaction(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("hello"),
                  Text("hello2"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("right side"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
