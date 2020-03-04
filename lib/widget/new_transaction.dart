import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();


  NewTransaction(this._addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text("first row"),
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "amount"),
              controller: amountController,
            ),
            Container(
              child: FlatButton(
                onPressed: (){
                  _addTransaction(titleController.text, double.parse(amountController.text));
                },
                textColor: Colors.deepPurple,
                child: Text("helo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
