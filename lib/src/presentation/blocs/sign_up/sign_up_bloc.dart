import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart';

import '../../../core/cache/db_service.dart';

part 'sign_up_state.dart';
part 'sign_up_event.dart';
part 'sign_up_bloc.freezed.dart';

@injectable
class SingUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepositoryInterface _authRepository;
  SingUpBloc({required AuthRepositoryInterface authRepository})
    : _authRepository = authRepository,
      super(const _SignUpState()) {
    on<_RegisterWithEmailAndPassword>(_registerWithEmailAndPassword);
  }

  Future<void> _registerWithEmailAndPassword(
    _RegisterWithEmailAndPassword event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: ""));
    try {
      final response = await _authRepository.registerWithEmailAndPassword(
        event.email,
        event.password,
      );
      showAppSnackBar("Successfully registered!");
      DbService().saveAuthenticationStatus(
        (response?.uid != null) ? true : false,
      );
      if (response?.uid != null) {
        DbService().saveUid(response!.uid);
      }
      emit(state.copyWith(errorMessage: "", isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
      printLog(e.toString());
    }
  }
}
