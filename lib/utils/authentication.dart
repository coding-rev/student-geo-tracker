import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Authentication {
  // custom snackbar 
  static SnackBar customSnackBar({required String content}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),
  );
}
  // Initialize Firebase method
  static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }
  
  // Sign-In with Firebase and google method
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
          content:
            'The account already exists with a different credential.',
      ),
    );
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
          ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content:
                'Error occurred while accessing credentials. Try again.',
          ),
        );
        }
      } catch (e) {
        // handle the error here
        ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Google Sign-In. Try again.',
        ),
      );
      }
    }

    return user;
  }


  // Sign-Out method
  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

}



