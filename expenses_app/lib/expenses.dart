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

  Widget mainContent = const Text('No hay gastos');

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
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gasto eliminado'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            setState(() {
              _expenses.add(expense);
            });
          },
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    if(_expenses.isEmpty){
      mainContent = const Text('No hay gastos');
    } else {
      mainContent = ExpensesList(expenses: _expenses, onRemoveExpense: _removeExpense);
    }

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
        child: mainContent,
      ),
    );
  }
}
