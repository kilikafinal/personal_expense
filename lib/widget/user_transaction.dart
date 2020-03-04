import 'package:flutter/material.dart';
import 'package:personal_expense/model/transaction.dart';
import 'package:personal_expense/widget/new_transaction.dart';
import 'package:personal_expense/widget/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "1", title: "hello", amount: 2.2, date: DateTime.now()),
    Transaction(id: "2", title: "2lo", amount: 2.2, date: DateTime.now()),
    Transaction(id: "3", title: "3lo", amount: 2.2, date: DateTime.now()),
  ];
  void _addTransaction(String txTitle, double txAmount) {
    final transaction = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(transaction);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
