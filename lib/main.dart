import 'package:flutter/material.dart';

import 'transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(id: "1", title: "hello", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "3", title: "3lo", amount: 2.2, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app bar"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              child: Text("hello!"),
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          Column(
              children: transactions
                  .map((e) => Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.ac_unit,
                                color: Colors.blue,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(e.title),
                                Text(e.amount.toString()),
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList()),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
