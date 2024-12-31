import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/providers/house_user_provider.dart';
import 'package:app_mademin/providers/misc_provider.dart';
import 'package:app_mademin/providers/trinvoice_provider.dart';
import 'package:app_mademin/screen/auth/sign_in/auth_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahir Ademin',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const MyApp(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Auth
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MiscProvider(),
        ),
        // Master
        ChangeNotifierProvider(
          create: (context) => HouseUserProvider(),
        ),
        // Transaction
        ChangeNotifierProvider(
          create: (context) => TrInvoiceProvider(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const AuthRoot(),
      ),
    );
  }
}
