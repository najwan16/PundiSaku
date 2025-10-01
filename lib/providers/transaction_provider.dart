import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../services/local_transaction_repository.dart';

class TransactionProvider extends ChangeNotifier {
  final LocalTransactionRepository _repository = LocalTransactionRepository();
  List<Transaction> _transactions = [];
  Map<String, double> _summary = {'income': 0, 'expense': 0};

  List<Transaction> get transactions => _transactions;
  Map<String, double> get summary => _summary;

  Future<void> loadData() async {
    _transactions = (await _repository.getTransactions())
        .map((map) => Transaction.fromMap(map as Map<String, dynamic>))
        .toList();
    _summary = await _repository.getSummary();
    notifyListeners();
  }

  Future<void> addTransaction(Transaction transaction) async {
    await _repository.insertTransaction(transaction.toMap());
    await loadData();
  }
}
