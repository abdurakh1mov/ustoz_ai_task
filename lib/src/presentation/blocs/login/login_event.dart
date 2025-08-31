part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.signInWithEmailAndPassword({
    required String email,
    required String password,
  }) = _SignInWithEmailAndPassword;

  const factory LoginEvent.signInWithGoogle({required BuildContext context}) =
      _SignInWithGoogle;
      
}
