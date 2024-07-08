// ignore_for_file: prefer_function_declarations_over_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/domain/provider/provider.dart';
import 'package:parking_nayak/presentation/pages/home/home_screen.dart';
import 'package:parking_nayak/utils/local_storage.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut({required BuildContext context}) async {
    try {
      // await _googleSignIn.signOut();
      await _auth.signOut();
      // await storage.delete(key: "token");
      final snackBar = SnackBar(content: Text("Sign Out successful"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInwithPhoneNumber(String verificationId, String smsCode,
      BuildContext context, WidgetRef ref) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      // storeTokenAndData(userCredential);

      final currentUserId = FirebaseAuth.instance.currentUser!.uid;
      ref.read(
        createOfficerProvider(
          batchId: "",
          userId: currentUserId,
          officerName: "",
          phoneNo: "",
          location: "",
        ),
      );
      ref.read(isAuth.notifier).state = true;
      LocalStorage.isAuth(true);
      showSnackBar(
          context, "Logged In, Successful!", ColorManager.primaryColor);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    } catch (e) {
      showSnackBar(context, e.toString(), ColorManager.alertColor);
    }
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(
          context, "Verification Completed", ColorManager.primaryColor);
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString(), ColorManager.alertColor);
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number",
          ColorManager.primaryColor);
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      // showSnackBar(context, "Time out", ColorManager.alertColor);
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString(), ColorManager.alertColor);
    }
  }

  void showSnackBar(BuildContext context, String text, Color bgColor) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: bgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
