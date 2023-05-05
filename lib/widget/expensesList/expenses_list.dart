import "package:constructor_data/models/expense_model.dart";
import "package:constructor_data/widget/expensesList/expense_item.dart";
import "package:flutter/material.dart";

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoved});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          //Dismissible is used to make swipe to delelte funvionLITY
          // BUT YOULL have to create a function to delete also
          key: ValueKey(expenses[index]),
          //I did dot passed value to on removed
          onDismissed: (direction) => onRemoved(expenses[index]),
          direction: DismissDirection.endToStart,
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
