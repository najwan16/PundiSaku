import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        var tx = transactions[index];
        return InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tapped: ${tx.description}')));
          },
          child: ListTile(
            title: Text('${tx.type.toUpperCase()}: ${tx.amount} - ${tx.category}'),
            subtitle: Text('${tx.description} - ${DateFormat('dd MMM yyyy').format(tx.date)}'),
          ),
        );
      },
    );
  }
}