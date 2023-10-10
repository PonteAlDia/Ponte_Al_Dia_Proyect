import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ponte_al_dia/firebase_options.dart';

import 'package:ponte_al_dia/src/pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      title: 'Ponte al día',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
      },
    );
  }
}
