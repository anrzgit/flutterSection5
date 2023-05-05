import 'package:constructor_data/widget/expensesList/expenses_list.dart';
import 'package:constructor_data/models/expense_model.dart';
import 'package:constructor_data/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  final bool darkMode = true;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    //type of list should be same as constructor
    //now here I will use constructor to assign values

    Expense(
        title: "Flutter Course",
        amount: 19.9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 49.9,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _addExpenses(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
    Navigator.pop(context);
  }

  void _removeExpense(Expense removedExpense) {
    setState(() {
      _registeredExpenses.remove(removedExpense);
    });
  }

  void setdarkMode() {
    setState(() {});
  }

  void _openAddExpenseOverlay() {
    //showModalBottomSheet is that bottom down menu
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpenses,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Transaction App 3",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () => _openAddExpenseOverlay(),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //add button
            const Text('Chart'),
            _registeredExpenses.isEmpty
                ? const Center(
                    child: Text("No Expense Add Some"),
                  )
                : ExpensesList(
                    expenses: _registeredExpenses,
                    onRemoved: _removeExpense,
                  )
          ],
        ),
      ),
    );
  }
}


// final expenseIndex = _registeredExpenses.indexOf(removedExpense);
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       duration: const Duration(seconds: 5),
//       content: const Text("Deleted"),
//       action: SnackBarAction(
//           label: 'Undo',
//           onPressed: () {
//             _registeredExpenses.insert(expenseIndex, removedExpense);
//           }),
//     )); 