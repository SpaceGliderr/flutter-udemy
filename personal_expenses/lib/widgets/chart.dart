import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalAmount = 0;

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekday.day &&
            transactions[i].date.month == weekday.month &&
            transactions[i].date.year == weekday.year) {
          totalAmount += transactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekday), "amount": totalAmount};
    }).reversed.toList(); // Reverses a given list
  }

  double get totalSpending {
    // Similar to JS reduce
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((val) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  val["day"],
                  val["amount"],
                  totalSpending == 0.0
                      ? 0.0
                      : (val["amount"] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
