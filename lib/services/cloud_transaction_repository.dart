import '../models/transaction.dart';

class CloudTransactionRepository {
  Future<int> insertTransaction(Transaction transaction) async {
    return Future.value(0);
  }

  Future<List<Transaction>> getTransactions() async {
    return [];
  }

  Future<Map<String, double>> getSummary() async {
    return {'income': 0, 'expense': 0};
  }
}
