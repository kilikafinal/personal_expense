import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense/widget/chart.dart';
import 'package:personal_expense/widget/new_transaction.dart';
import 'package:personal_expense/widget/transaction_list.dart';

import 'model/transaction.dart';

void main() {
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my App",
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String titleInput;
  String amountInput;

  final List<Transaction> _userTransactions = [
    Transaction(id: "1", title: "hello", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "3", title: "3lo", amount: 2.2, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount, DateTime dt) {
    final transaction = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: dt);

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  bool _showChart = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var isLandscape = mediaQuery.orientation == Orientation.landscape;

    var _buildCupertinoAppBar = CupertinoNavigationBar(
      middle: Text("Personal Expense"),
      trailing: Row(
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.add),
            onTap: () {
              startAddNewTransaction(context);
            },
          )
        ],
      ),
    );

    var _buildAppBar = AppBar(
      title: Text("Personal Expense"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
      ],
    );

    double appHeight = (mediaQuery.size.height -
        mediaQuery.padding.top -
        _buildAppBar.preferredSize.height);

    return Scaffold(
      appBar: isLandscape ? _buildCupertinoAppBar : _buildAppBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Show Chart"),
                Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                ),
              ],
            ),
            if (!isLandscape && _showChart)
              Container(
                height: appHeight * .3,
                child: Chart(_recentTransactions),
              ),
            Container(
              height: appHeight * .7,
              child: TransactionList(_userTransactions, deleteTransaction),
            ),
          ],
        ),
      ),
    );
  }
}
