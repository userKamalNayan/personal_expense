import 'package:flutter/cupertino.dart';

class Transaction {
  String id, title;
  DateTime dateTime;
  double amount;

  Transaction(
      {
        @required this.id,
      @required this.title,
      @required this.dateTime,
      @required this.amount
      });
}
