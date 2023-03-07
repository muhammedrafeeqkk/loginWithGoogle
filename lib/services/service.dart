import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBase_Services {
  final _googleSigning = GoogleSignIn();

  final _auth = FirebaseAuth.instance;
  userSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSigning.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googlesigningAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authcridential = GoogleAuthProvider.credential(
            accessToken: googlesigningAuthentication.accessToken,
            idToken: googlesigningAuthentication.idToken);
        await _auth.signInWithCredential(authcridential);
      }
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      throw e;
    }
  }

  userSignOut() async {
    await _googleSigning.signOut();
  }

  
}
