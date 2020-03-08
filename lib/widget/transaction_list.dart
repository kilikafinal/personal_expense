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
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "hello",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: constraints.maxHeight * .5,
                        child: Image.asset(
                          "assets/images/waiting.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  );
                },
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
                      trailing: MediaQuery.of(context).size.width > 450
                          ? FlatButton.icon(
                              onPressed: () {
                                deleteTransaction(transactions[index].id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              label: const Text("delete"),
                              textColor: Colors.red,
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
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
