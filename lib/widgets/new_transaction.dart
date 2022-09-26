// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function submitHandler;

  const NewTransaction(this.submitHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate = null;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.submitHandler(enteredTitle, enteredAmount, selectedDate);

    Navigator.of(context).pop();
  }

  void _chooseDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(selectedDate == null
                        ? "No Date Choosen"
                        : "Picked Date : ${DateFormat.yMd().format(selectedDate!)}"),
                  ),
                  TextButton(
                    onPressed: _chooseDatePicker,
                    child: Text('Choose Date'),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
