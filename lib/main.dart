import 'package:flutter/material.dart';
import 'package:uts_tpm/presentation/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APLIKASI UTS TPM',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const LoginScreen(),
    );
  }
}
