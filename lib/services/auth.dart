import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FireAuth {
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        Get.showSnackbar(const GetSnackBar(title: 'The password provided is too weak.',duration: Duration(seconds: 2),));
      } else if (e.code == 'email-already-in-use') {
        Get.showSnackbar(const GetSnackBar(title: 'The account already exists for that email.',duration: Duration(seconds: 2),));
      }
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(title: 'Some Error Occurred',duration: Duration(seconds: 2),));

    }
    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    }
    on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password provided.')));
      }
      else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid Credentials.Re-enter Correct Credentials')));
      }
      else if(e.code == 'too-many-requests'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error: Try Again Later!!!')));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error: Try Again!!!')));
      }
    }

    return user;
  }

}