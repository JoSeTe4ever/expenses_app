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

  //dropDown no tiene la habilidad de poner controller :(
  Category _selectedCategory = Category.other;

  DateTime? _selectedDate;

  //create dispose method
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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

  void _saveTitle(String value) {
    print(value);
    _expenseTitle = value;
  }

  void _submitExpenseData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      // show error message
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please enter a valid title and amount'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Okay'))
                ],
              ));
    }

    final newExpense = Expense(
        title: enteredTitle,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory);

    Navigator.of(context).pop();
    
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
                    Text(_selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!)),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                  value: _selectedCategory as Category,
                  items: List.of(Category.values.map((e) => DropdownMenuItem(
                      value: e,
                      child:
                          Text(e.toString().toUpperCase().split('.').last)))),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _selectedCategory = value as Category;
                    });
                  }),
              Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  _submitExpenseData();
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
