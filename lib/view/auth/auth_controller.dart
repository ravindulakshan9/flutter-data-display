// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Sign-in failed. Please try again later.')),
        );
      }
    } else {}
  } catch (error) {
    print('Error signing in with Google: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign-in failed. Please try again later.')),
    );
  }
}

Future<void> signOut(BuildContext context) async {
  try {
    await _auth.signOut();
    await _googleSignIn.signOut();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign-out successful')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign-out failed. Please try again later.')),
    );
  }
}
