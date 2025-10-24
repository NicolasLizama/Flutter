import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'HomeScreen.dart';
import 'AcercaDeScreen.dart';
import 'IntegrantesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market DuocUC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrangeAccent,
          primary: Colors.deepOrangeAccent,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Loginscreen(),
        '/home': (context) => HomeScreen(),
        '/acerca': (context) => const AcercaDeScreen(),
        '/integrantes': (context) => const IntegrantesScreen(),
      },
    );
  }
}
