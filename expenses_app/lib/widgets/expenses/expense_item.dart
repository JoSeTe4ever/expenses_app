import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Text(expense.title),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(expense.amount.toStringAsFixed(2)),
              const Spacer(), // esto para ocupar todo el espacio
              Row(
                children: [
                  Text(
                    categoryIcons[expense.category]!,
                    textScaler: const TextScaler.linear(1.8),
                  ),
                  Text(expense.formattedDate),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
