import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

import '../../../data/model/rate_model.dart';
import '../../../data/model/user_model.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final MainRepositoryInterface _repository;
  HomeCubit({required MainRepositoryInterface repository})
    : _repository = repository,
      super(const _HomeState());

  Future<void> fetchUserTransactions() async {
    emit(state.copyWith(isLoading: true));
    try {
      emit(state.copyWith(isLoading: true));
      final uid = DbService().uid;
      final transactions = await _repository.getUserTransactions(
        uid: uid ?? "",
      );
      printLog("transactions: ${transactions.length}");
      emit(state.copyWith(userTransactions: transactions, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchUserData() async {
    try {
      final uid = DbService().uid;
      if (uid == null) return;
      final userData = await _repository.getOverallSums(uid: uid);
      emit(state.copyWith(userData: userData));
    } catch (e) {
      emit(state.copyWith());
    }
  }

  Future<void> fetchRate() async {
    try {
      final rate = await _repository.getRate();
      emit(state.copyWith(rate: rate));
    } catch (e) {
      emit(state.copyWith());
    }
  }
}
