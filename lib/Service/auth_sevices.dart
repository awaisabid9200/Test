import 'dart:async';
import 'package:dummy_fire/View/Pages/HomePage.dart';
import 'package:dummy_fire/View/Pages/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<void> signInWithGoogle(BuildContext context, String nextScreen) async {
  try {
    // Show loading indicator
    EasyLoading.show(status: 'Signing in with Google...');

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // Google Sign-In was canceled by the user.
      return;
    }

    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    // Dismiss the loading indicator when the authentication is successful.
    EasyLoading.dismiss();

    // Navigate to the next screen.
    Navigator.pushNamed(context, nextScreen);
  } catch (e) {
    // Dismiss the loading indicator when an error occurs.
    EasyLoading.dismiss();

    // Handle the error and optionally show an error message to the user.
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred during Google Sign-In.'),
      ),
    );
  }
}
// --- sign in auth --- //


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(BuildContext context, String email, String password) async {
    try {
      EasyLoading.show(status: 'Loading...');

      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Navigate to the HomePage on successful login
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        // Show an error SnackBar for login failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please check your credentials.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Show an error SnackBar for authentication error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication error: ${e.message}'),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      EasyLoading.dismiss(); // Dismiss EasyLoading
    }
  }
}

// --- forgot password --- //

class ForgotPassword {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future resetPassword(BuildContext context, String email) async {
    try {
      // Show loading indicator
      EasyLoading.show(status: 'Sending reset email...');

      await _auth.sendPasswordResetEmail(email: email);

      // Dismiss loading indicator when the email is sent
      EasyLoading.dismiss();

      // Navigate to the LoginScreen
      Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      // Dismiss loading indicator when an error occurs
      EasyLoading.dismiss();

      print(e);
      Get.snackbar('', '${e.message}');
    }
  }
}

