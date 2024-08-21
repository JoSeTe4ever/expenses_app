import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses/expenses_list.dart';
import 'package:expenses_app/widgets/expenses/new_expense.dart';
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
        category: Category.food),
    Expense(
        title: 'Madre mia que hartá a gastar',
        amount: 2.23,
        date: DateTime.now(),
        category: Category.savings),
  ];

  void _openExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Text(style: TextStyle(color: Colors.white), 'Expenses'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                //OPEN A MODAL
                _openExpenseOverlay();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ExpensesList(expenses: _expenses),
      ),
    );
  }
}
