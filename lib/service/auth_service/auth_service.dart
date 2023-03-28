import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw Exception();
    }
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on Exception {
      throw Exception();
    }
  }
}
