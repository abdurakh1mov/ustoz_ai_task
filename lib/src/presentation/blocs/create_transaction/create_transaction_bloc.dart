import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/home/home_cubit.dart';

import '../../../core/constants/global_keys.dart';
import '../../../data/model/category_model.dart';

part 'create_transaction_state.dart';
part 'create_transaction_event.dart';
part 'create_transaction_bloc.freezed.dart';

@injectable
class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  final MainRepositoryInterface _repository;
  CreateTransactionBloc({required MainRepositoryInterface repository})
    : _repository = repository,
      super(const _CreateTransactionState()) {
    on<_FetchCategories>(_fetchCategories);
    on<_CreateTransactionEvent>(_addTransaction);
    on<_FetchCategoriesIncome>(_fetchCategoriesIncome);
    on<_ChangeOverallSums>(_changeOverallSums);
  }

  Future<void> _fetchCategories(
    _FetchCategories event,
    Emitter<CreateTransactionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await _repository.getCategories();
      emit(state.copyWith(categories: categories));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _fetchCategoriesIncome(
    _FetchCategoriesIncome event,
    Emitter<CreateTransactionState> emit,
  ) async {
    try {
      final categories = await _repository.getCategoriesIncome();
      emit(state.copyWith(categoriesIncome: categories, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _changeOverallSums(
    _ChangeOverallSums event,
    Emitter<CreateTransactionState> emit,
  ) async {
    try {
      int newIncomes = 0;
      int newExpenses = 0;
      if (!event.isUsd) {
        newIncomes = event.isIncome
            ? event.incomes + event.amount
            : event.incomes;
        newExpenses = !event.isIncome
            ? event.expenses + event.amount
            : event.expenses;
      } else {
        newIncomes = event.isIncome
            ? ((event.amount *
                          double.parse(
                            (GlobalKeys.homeScaffoldKey.currentContext
                                        ?.read<HomeCubit>()
                                        .state
                                        .rate
                                        ?.rate ??
                                    0)
                                .toString(),
                          ))
                      .toInt() +
                  event.incomes)
            : event.incomes;
        printLog("newIncomes: $newIncomes");
        newExpenses = !event.isIncome
            ? ((event.amount *
                          double.parse(
                            (GlobalKeys.homeScaffoldKey.currentContext
                                        ?.read<HomeCubit>()
                                        .state
                                        .rate
                                        ?.rate ??
                                    0)
                                .toString(),
                          ))
                      .toInt() +
                  event.expenses)
            : event.expenses;
        printLog("newExpenses: $newExpenses newIncomes: $newIncomes");
      }
      final uid = DbService().uid;
      _repository.calculateOverall(
        uid: uid.toString(),
        income: newIncomes,
        expense: newExpenses,
      );
    } catch (e) {
      // Handle error if necessary
    }
  }

  Future<void> _addTransaction(
    _CreateTransactionEvent event,
    Emitter<CreateTransactionState> emit,
  ) async {
    final uid = DbService().uid;
    try {
      emit(state.copyWith(isCreatingLoading: true));
      await _repository.addTransaction(
        isIncome: event.isIncome,
        note: event.note,
        amount: event.amount.replaceAll(event.isUsd ? "USD" : "UZS", ""),
        date: event.date,
        isUsd: event.isUsd,
        category: event.category.title,
        uid: uid.toString(),
      );
      final homeContextBloc = GlobalKeys.homeScaffoldKey.currentContext
          ?.read<HomeCubit>();

      homeContextBloc?.fetchUserTransactions();
      homeContextBloc?.fetchUserData();
      emit(state.copyWith(isSuccess: true, isCreatingLoading: false));
      showAppSnackBar("Transaction added successfully");
      Future.microtask(() {
        add(
          CreateTransactionEvent.changeOverallSums(
            isUsd: event.isUsd,
            isIncome: event.isIncome,
            amount: int.parse(
              event.amount
                  .replaceAll(",", "")
                  .replaceAll(event.isUsd ? "USD" : "UZS", ""),
            ),
            incomes: homeContextBloc?.state.userData?.income ?? 0,
            expenses: homeContextBloc?.state.userData?.expense ?? 0,
          ),
        );
      });
      // ignore: use_build_context_synchronously
      Navigator.of(event.context).pop();
    } catch (e) {
      emit(
        state.copyWith(
          isSuccess: false,
          errorMessage: e.toString(),
          isCreatingLoading: false,
        ),
      );
    }
  }
}
