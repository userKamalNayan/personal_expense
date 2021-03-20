import 'package:flutter/material.dart';
import 'package:personal_expense/Model/Transaction.dart';
import 'package:personal_expense/Widgets/transaction_list.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {


  final List<Transaction> _userTransactions =[
    new Transaction(
        id: "tr1", title: "First tr", dateTime: DateTime.now(), amount: 30),
    new Transaction(
        id: "tr2", title: "First tr", dateTime: DateTime.now(), amount: 15),
  ];


  void _addNewTransaction(String txTitle, double txAmount)
  {
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, dateTime: DateTime.now(), amount: txAmount);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
