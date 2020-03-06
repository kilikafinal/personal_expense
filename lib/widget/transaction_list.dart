import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "hello",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Container(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "\$${transactions[index].amount.toStringAsFixed(2)}"),
                          ),
                        ),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteTransaction(transactions[index].id);
                        },
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
