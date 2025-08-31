part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default('') String successMessage,
  }) = _LoginState;
}
