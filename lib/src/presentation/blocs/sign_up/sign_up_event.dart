part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.registerWithEmailAndPassword({
    required String email,
    required String password,
  }) = _RegisterWithEmailAndPassword;

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  // TODO: implement password
  String get password => throw UnimplementedError();
}
