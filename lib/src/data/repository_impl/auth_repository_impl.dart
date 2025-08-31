import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart';

@Injectable(as: AuthRepositoryInterface)
class AuthRepositoryImpl implements AuthRepositoryInterface {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to sign in: ${e.message}');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<User?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to register: ${e.message}');
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to send password reset email: ${e.message}');
    }
  }

  @override
  Future<void> updateUserProfile(String? displayName, String? photoURL) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(displayName);
      await _firebaseAuth.currentUser?.updatePhotoURL(photoURL);
      await _firebaseAuth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to update user profile: ${e.message}');
    }
  }

  @override
  Future<void> deleteUser({
    required String password,
    required String email,
  }) async {
    try {
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
      await _firebaseAuth.currentUser?.delete();
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to delete user: ${e.message}');
    }
  }

  @override
  Future<void> resetPasswordFromCurrentPassword({
    required String newPassword,
    required String email,
    required String currentPassword,
  }) async {
    try {
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: currentPassword),
      );
      await _firebaseAuth.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to reset password: ${e.message}');
    }
  }

  @override
  Future<User?> signInWithGoogle() {
    return GoogleSignInService.signInWithGoogle()
        .then((userCredential) async {
          final User? user = userCredential?.user;
          if (user != null) {
            final userDoc = FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid);
            final docSnapshot = await userDoc.get();
            if (!docSnapshot.exists) {
              await userDoc.set({
                'uid': user.uid,
                'name': user.displayName ?? '',
                'email': user.email ?? '',
                'photoURL': user.photoURL ?? '',
                'provider': 'signInWithGoogle',
                'createdAt': FieldValue.serverTimestamp(),
              });
            }
          }
        })
        .catchError((error) {
          throw Exception('Failed to sign in with Google: $error');
        });
  }
}

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;
      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes(['email', 'profile']);
      final accessToken = authorization?.accessToken;
      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );
        if (authorization2?.accessToken == null) {
          throw FirebaseAuthException(code: "error", message: "error");
        }
        authorization = authorization2;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        final userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid);
        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            'uid': user.uid,
            'name': user.displayName ?? '',
            'email': user.email ?? '',
            'photoURL': user.photoURL ?? '',
            'provider': 'google',
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }
      return userCredential;
    } catch (e) {
      printLog('Error: $e');
      rethrow;
    }
  }
}
