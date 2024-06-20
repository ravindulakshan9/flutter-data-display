// Example of HomeScreen
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-out successful')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Sign-out failed. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ElevatedButton(
        onPressed: () => _signOut(context),
        child: const Text('Sign Out'),
      ),
    );
  }
}
