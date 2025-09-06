import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/cache/db_base.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/navigator/router_names.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

import '../../../data/model/user_model.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final MainRepositoryInterface _repository;
  ProfileCubit({required MainRepositoryInterface repository})
    : _repository = repository,
      super(const _ProfileState());
  final uid = DbService().uid ?? "";
  Future<void> fetchUserData() async {
    try {
      final userData = await _repository.getUserData(uid: uid);
      emit(state.copyWith(userData: userData, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> logout({required BuildContext context}) async {
    try {
      // await _repository.logout();

      emit(state.copyWith(isLoading: true));
      HiveBase().deleteHiveBox();
      DbService().saveAuthenticationStatus(false);
      // ignore: use_build_context_synchronously
      context.pushReplacementNamed(RouterNames.login);
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
