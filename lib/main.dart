import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pundi_saku/pages/add_transaction_screen.dart';
import 'providers/transaction_provider.dart';
import 'pages/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider()..loadData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PundiSaku',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/add': (context) => const AddTransactionScreen(),
      },
    );
  }
}
