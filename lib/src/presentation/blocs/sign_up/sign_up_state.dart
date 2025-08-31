part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool isSuccess,
    @Default('') String successMessage,
  }) = _SignUpState;
}
