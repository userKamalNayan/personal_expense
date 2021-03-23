import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/Model/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$ ${_userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userTransactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                            // style: TextStyle(
                            //   color: Colors.black54,
                            //   fontSize: 18,
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),
                          Text(
                            DateFormat()
                                .add_yMMMd()
                                .format(_userTransactions[index].dateTime),
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
