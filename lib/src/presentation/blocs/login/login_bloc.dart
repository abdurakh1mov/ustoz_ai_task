import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart';

part 'login_state.dart';
part 'login_event.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositoryInterface _authRepository;
  LoginBloc({required AuthRepositoryInterface authRepository})
    : _authRepository = authRepository,
      super(const _LoginState()) {
    on<_SignInWithEmailAndPassword>(_signInWithEmailAndPassword);
    on<_SignInWithGoogle>(_signInWithGoogle);
  }

  Future<void> _signInWithEmailAndPassword(
    _SignInWithEmailAndPassword event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      DbService().saveAuthenticationStatus(
        (response?.uid != null) ? true : false,
      );
      if (response?.uid != null) {
        DbService().saveUid(response!.uid);
      }
      emit(state.copyWith(errorMessage: "", isLoading: false, isSuccess: true));
      showAppSnackBar("Successfully logged in!");
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
      printLog(e.toString());
    }
  }

  Future<void> _signInWithGoogle(
    _SignInWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ""));
      final response = await _authRepository.signInWithGoogle();
      printLog("fsansfkanfkansfkanskf ${response?.uid}");
      DbService().saveAuthenticationStatus(
        (response?.uid != null) ? true : false,
      );
      if (response?.uid != null) {
        DbService().saveUid(response!.uid);
      }
      emit(state.copyWith(isSuccess: true, errorMessage: "", isLoading: false));
      showAppSnackBar("Successfully logged in!");
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
      printLog(e.toString());
    }
  }
}
