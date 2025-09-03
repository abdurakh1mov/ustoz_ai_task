import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepositoryInterface _authRepository;
  LoginCubit({required AuthRepositoryInterface authRepository})
    : _authRepository = authRepository,
      super(const _LoginState());

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
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

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ""));
      final response = await _authRepository.signInWithGoogle();
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
