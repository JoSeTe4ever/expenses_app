import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses/expense_item.dart';
import 'package:flutter/material.dart';

//we do not want the widget to be stateful since it is a read-only widget
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Dismissible(
            onDismissed: (direction) {
              onRemoveExpense(expense);
            },
              key: ValueKey(expense.id),
              child: ExpenseItem(expense: expense));
        });
  }
}
