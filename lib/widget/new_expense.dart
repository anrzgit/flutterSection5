import 'package:constructor_data/models/expense_model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function(Expense addExpense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.leisure;

  DateTime? _selectedDate;

  DateTime firstDate = DateTime(DateTime.now().year - 10);
  DateTime lastDate = DateTime.now();

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    bool amountIsInvalid;
    if (enteredAmount == null ||
        enteredAmount <= 0 ||
        _titleController.text.trim().isEmpty ||
        _selectedDate == null) {
      amountIsInvalid = true;
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text("Please cleck the values entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
    } else {
      amountIsInvalid = false;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount!,
        date: _selectedDate!,
        category: _selectedCategory));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // created another container to add dynamic paddding for kryboard using padding: MediaQuery.of(context).viewInsets,
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Amount"), prefixText: '\$ '),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Selected '
                        : dateFormat.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                DropdownButton(
                    value: _selectedCategory, //deafault value
                    items: Category.values
                        .map((e) => DropdownMenuItem(
                            value: e, child: Text(e.name.toUpperCase())))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    }),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      //closes the overlay
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: _submitExpense, child: const Text("save"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
