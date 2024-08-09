import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
        title: 'Gasto 1',
        amount: 2.23,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Otro gasto 2',
        amount: 2.23,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Madre mia que hartá a gastar',
        amount: 2.23,
        date: DateTime.now(),
        category: Category.other),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Center(
        child: ExpensesList(expenses: _expenses),
      ),
    );
  }
}
