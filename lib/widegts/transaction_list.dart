import '../models/transaction.dart';
import 'package:flutter/material.dart';
import './transaction-item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransactionList(this.transactions, this.delTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      delTx: delTx,
                    ))
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       return TransactionItem(transaction: transactions[index], delTx: delTx);
    //     },
    //     itemCount: transactions.length,
    //     // children: transactions.map((tx) {  }).toList(),
    //   );
  }
}
