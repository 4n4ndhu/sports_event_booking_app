import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/app_utils.dart';

class RegistrationScreenController extends ChangeNotifier {
  Future<void> onRegistration(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log(credential.user?.uid.toString() ?? "no data");

      if (credential.user?.uid != null) {
        AppUtils.showOnetimeSnackbar(
            context: context,
            bg: Colors.green,
            message: 'The account already exists for that email.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppUtils.showOnetimeSnackbar(
            context: context,
            bg: Colors.red,
            message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppUtils.showOnetimeSnackbar(
            context: context,
            bg: Colors.red,
            message: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
