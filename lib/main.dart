import 'package:flutter/material.dart';
import 'auth/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase Crud',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
