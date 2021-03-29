import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/Model/Transaction.dart';
import 'package:personal_expense/Widgets/chart.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          "\$${_userTransactions[index].amount}",
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    _userTransactions[index]
                            .title
                            .substring(0, 1)
                            .toUpperCase() +
                        _userTransactions[index].title.substring(
                            1,
                            _userTransactions[index]
                                .title
                                .length), // this is done to make only first letter capital forcibly
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      _userTransactions[index].dateTime,
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          onPressed: () =>
                              _deleteTransaction(_userTransactions[index].id),

                          icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),
                          label: Text('Delete',style: TextStyle(color: Theme.of(context).errorColor),))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              _deleteTransaction(_userTransactions[index].id),
                        ),
                ),
              );
            },
            itemCount: _userTransactions.length,
          );
  }
}
