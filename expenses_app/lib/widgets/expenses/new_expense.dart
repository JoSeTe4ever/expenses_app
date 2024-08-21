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
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Amount', prefixText: '€'),
                keyboardType: TextInputType.number,
                controller: _amountController,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [],
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
