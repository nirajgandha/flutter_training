import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expense_item.dart';

class TransactionList extends StatelessWidget {
  final List<Expense> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) => ExpenseItem(
                      key: ValueKey(tx.id),
                      expense: tx,
                      deleteExpense: deleteTx,
                    ))
                .toList());
  }
}
