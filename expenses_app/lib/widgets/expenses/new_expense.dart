import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseTitle = '';
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate;
    showDatePicker(
            context: context,
            initialDate: now,
            firstDate: firstDate,
            lastDate: now)
        .then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  //create dispose method
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveTitle(String value) {
    print(value);
    _expenseTitle = value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            maxLength: 80,
            onChanged: _saveTitle,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Amount', prefixText: '€'),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [
                    Text(_selectedDate == null ? 'No date selected': formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
