import 'package:counter_app/home.dart';
import 'package:counter_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseBackEnd {
  static registerUser(
      BuildContext context, String email, String name, String password) async {
    final User? registeredUser =
        (await firebaseAuth.createUserWithEmailAndPassword(
                email: email.trim(), password: password.trim()))
            .user;
    if (registeredUser != null) {
      Map userInfo = {
        'email': email,
        'name': name,
      };
      usersRef.child(registeredUser.uid).set(userInfo);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('Error');
    }
  }

  static userlogin(
      BuildContext context, String emailLogin, String passwordLogin) async {
    final User? userlogin = (await firebaseAuth.signInWithEmailAndPassword(
            email: emailLogin.trim(), password: passwordLogin.trim()))
        .user;
    if (userlogin != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('Error');
    }
  }

  static sendData(int value) {
    usersRef.child(firebaseAuth.currentUser!.uid).child('Value').set(value);
  }

  static Future getValue() async {
    await Future.delayed(const Duration(seconds: 1));
    final userValue = await usersRef
        .child(firebaseAuth.currentUser!.uid)
        .child('Value')
        .once(DatabaseEventType.value);
    var fetchedValue = userValue.snapshot;

    return fetchedValue.value;
  }
}
