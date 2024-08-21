import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('yyyy-MM-dd');
const uuid = Uuid();

const categoryIcons = {
  Category.food: '🍔',
  Category.transportation: '🚗',
  Category.shopping: '🛍️',
  Category.housing: '🏠',
  Category.entertainment: '🎉',
  Category.utilities: '💡',
  Category.insurance: '🛡️',
  Category.medical: '🩺',
  Category.savings: '💰',
  Category.other: '📦',
};

enum Category {
  food,
  transportation,
  shopping,
  housing,
  entertainment,
  utilities,
  insurance,
  medical,
  savings,
  other,
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}
