import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uid = Uuid();
final dateFormat = DateFormat.yMEd();

enum Category { food, travel, leisure, work }
//enum are predefined values that should not be changed during runtime

const categoryIcons = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.flight_land_outlined,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormat.format(date);
  }

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category}) //parameter list
      : id = uid.v4();
  //initialiser list can be used to initialise the id by another value which will not be provided by constructor
}
