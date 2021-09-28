import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late bool _isSigningIn = false;

  bool isSigningInGet() => _isSigningIn;

  void isSigningInSet(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  GoogleSignInProvider() {
    FirebaseAuth.instance.signOut();
  }

  Future<UserCredential?> login() async {
    isSigningInSet(true);
    GoogleSignInAccount? user = await GoogleSignIn().signIn();
    if (user != null) {
      final GoogleSignInAuthentication googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}
