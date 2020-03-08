import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percentOfAmountSpent;

  ChartBar({this.label, this.amountSpent, this.percentOfAmountSpent});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            FittedBox(
              child: Text("\$${amountSpent.toStringAsFixed(0)}"),
            ),
            SizedBox(
              height: (constraints.maxHeight - 10) * .05,
            ),
            Container(
              height: (constraints.maxHeight - 10) * .5,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentOfAmountSpent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ),
            Text("$label"),
          ],
        );
      },
    );
  }
}
