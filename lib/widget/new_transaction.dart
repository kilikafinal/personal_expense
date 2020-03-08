import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime pickedDate;

  void _submitData() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);
    final DateTime enteredDate =
        pickedDate == null ? DateTime.now() : pickedDate;
    widget._addTransaction(enteredTitle, enteredAmount, enteredDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 14)),
            lastDate: DateTime.now().add(Duration(days: 14)))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        pickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).padding.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: pickedDate == null
                      ? Text("No Date chosen!")
                      : Text(
                          "Date chosen: ${DateFormat.yMd().format(pickedDate)}"),
                ),
                FlatButton(
                  child: Text("Choose Date"),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
            Container(
              child: FlatButton(
                onPressed: _submitData,
                textColor: Colors.deepPurple,
                child: Text("Add Transaction"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
