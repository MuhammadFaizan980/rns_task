import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rns_task/screens/login_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: LoginScreen(),
    ),
  );
}
