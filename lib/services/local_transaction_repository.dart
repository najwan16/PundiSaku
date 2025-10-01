import '../models/transaction.dart';
import 'database_helper.dart';

class LocalTransactionRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<int> insertTransaction(Transaction transaction) async {
    Database db = await _databaseHelper.database;
    return await db.insert('transactions', transaction.toMap());
  }

  Future<List<Transaction>> getTransactions() async {
    Database db = await _databaseHelper.database;
    List<Map<String, dynamic>> maps = await db.query('transactions', orderBy: 'date DESC');
    return List.generate(maps.length, (i) => Transaction.fromMap(maps[i]));
  }

  Future<Map<String, double>> getSummary() async {
    List<Transaction> transactions = await getTransactions();
    double income = 0;
    double expense = 0;
    for (var tx in transactions) {
      if (tx.type == 'income') income += tx.amount;
      else expense += tx.amount;
    }
    return {'income': income, 'expense': expense};
  }
}