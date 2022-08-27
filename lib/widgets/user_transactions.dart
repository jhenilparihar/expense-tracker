import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 800,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weakly Groceries',
      amount: 300,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Jam',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicines',
      amount: 250,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Vegetables',
      amount: 50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Fruits',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Tax',
      amount: 800,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction)
      ],
    );
  }
}
