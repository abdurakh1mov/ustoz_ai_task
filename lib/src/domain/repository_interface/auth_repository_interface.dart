import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepositoryInterface {
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<User?> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> sendPasswordResetEmail({required String email});
  Future<void> updateUserProfile(String? displayName, String? photoURL);
  Future<void> deleteUser({required String password, required String email});
  Future<void> resetPasswordFromCurrentPassword({
    required String newPassword,
    required String email,
    required String currentPassword,
  });
  Future<User?> signInWithGoogle();
}
