import 'package:chat_smth/Pages/Login_Page.dart';
import 'package:chat_smth/Pages/RegisterPage.dart';
import 'package:chat_smth/Services/auth/auth_gate.dart';
import 'package:chat_smth/Services/auth/auth_service.dart';
import 'package:chat_smth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Services/auth/login_or_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
        create: (context) => AuthService(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),

    );

  }
}
