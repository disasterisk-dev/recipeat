import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeat/models/app_user.dart';

class UserResponse {
  UserResponse({this.user, this.error});

  final AppUser? user;
  final String? error;
}

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign up new user
  static Future<UserResponse> signUp(String email, String password) async {
    try {
      final UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        return UserResponse(
          user: AppUser(
            uid: credential.user!.uid,
            email: credential.user!.email!,
          ),
        );
      }

      return UserResponse(error: "Could not sign up with these credentials");
    } on FirebaseAuthException catch (e) {
      return UserResponse(error: e.message);
    }
  }

  // sign in existing user
  static Future<UserResponse> signIn(String email, String password) async {
    try {
      final UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        return UserResponse(
          user: AppUser(
            uid: credential.user!.uid,
            email: credential.user!.email!,
          ),
        );
      }

      return UserResponse(error: "Could not log in");
    } on FirebaseAuthException catch (e) {
      return UserResponse(error: e.message.toString());
    }
  }

  // sign logged in user out
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
