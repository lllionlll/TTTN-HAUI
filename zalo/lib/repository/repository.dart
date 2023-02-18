import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zalo/constants/constants.dart';
import 'package:zalo/models/user.dart';

class Repository {
  static Future<String> createUser({
    required String emailAddress,
    required String password
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      UserModel user = UserModel(
        email: emailAddress,
        isActive: true,
        old: null,
        lastActive: null,
        uid: credential.user!.uid,
        homeTown: null,
        cover: null,
        avt: null,
        sex: 0
      );

      await FirebaseFirestore.instance
            .collection('users')
            .add(user.toJson());

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Constants.WEAK_PASSWORD;
      } else if (e.code == 'email-already-in-use') {
        return Constants.EMAIL_IS_READY;
      }
    } catch (e) {
      return e.toString();
    }
    return Constants.CREAT_SUCCESS;
  }

  static Future<String> signIn({
    required String emailAddress,
    required String password
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      return Constants.ACCOUNT_NOT_CORRECT;
    }
    return Constants.SIGN_IN_SUCCESS;
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

}