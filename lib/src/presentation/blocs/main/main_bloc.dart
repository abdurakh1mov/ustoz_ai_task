import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

import '../../../data/model/category_model.dart';

part 'main_state.dart';
part 'main_event.dart';
part 'main_bloc.freezed.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepositoryInterface _repository;
  MainBloc({required MainRepositoryInterface repository})
    : _repository = repository,
      super(const _MainState()) {
    on<_FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
    _FetchCategories event,
    Emitter<MainState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final categories = await _repository.getCategories();
      emit(state.copyWith(categories: categories, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
