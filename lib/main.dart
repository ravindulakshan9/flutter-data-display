import 'package:data_display_app/firebase_options.dart';
import 'package:data_display_app/view/auth/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/homescreen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const SignInScreen(),
      },
    );
  }
}
