import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meow_films/features/Data/Data%20Source/firebase_auth.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

class FireBaseAuthMethodsImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethodsImpl(this._auth);

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) {
    try {
      return _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailedException('Cannot signup. Please try again');
      }
    }
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) {
    try {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }

  @override
  Future<void> signOut() async {
    return _auth.signOut();
  }

  @override
  Future<void> sendEmailVerification() {
    return _auth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }
}

@riverpod
FireBaseAuthMethods firebaseAuthMethod(FirebaseAuthMethodRef ref) {
  return FireBaseAuthMethodsImpl(FirebaseAuth.instance);
}



// class AuthService {
//   static Future<User?> checkAuthStatus() async {
//     return FirebaseAuth.instance.currentUser;
//   }

//   static Future<void> signUp(
//       BuildContext context, String email, String password) async {
//     if (email.isEmpty || password.isEmpty) {
//       CustomAlertBox.show(context, Constant.logingError);
//     } else {
//       UserCredential? userCredential;
//       try {
//         userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyMainHome()),
//         );
//       } on FirebaseAuthException catch (e) {
//         return CustomAlertBox.show(context, e.code.toString());
//       }
//     }
//   }

//   static Future<void> login(
//       BuildContext context, String email, String password) async {
//     if (email.isEmpty || password.isEmpty) {
//       CustomAlertBox.show(context, Constant.logingError);
//     } else {
//       UserCredential? userCredential;
//       try {
//         userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyMainHome()),
//         );
//       } on FirebaseAuthException catch (e) {
//         return CustomAlertBox.show(context, e.code.toString());
//       }
//     }
//   }

//   static Future<void> logout(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage()),
//       );
//     } catch (e) {
//       print("Error during sign out: $e");
//     }
//   }
// }

// class Auth {
//   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   User? get currentUser => _firebaseAuth.currentUser;

//   Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

//   Future<void> signInWithEmailandPassword({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//   }

//   Future<void> createUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//   }

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
// }
// class FirebaseAuthSource {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   User? get currentUser => _firebaseAuth.currentUser;

//   Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

//     Future<void> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   Future<void> createUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
// }