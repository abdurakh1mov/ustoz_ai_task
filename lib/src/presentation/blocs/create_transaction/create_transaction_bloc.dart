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
import '../../../data/model/transaction_model.dart';

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
    on<_ChangeTransaction>(_changeTransaction);
    on<_DeleteTransaction>(_deleteTransaction);
  }

  final uid = DbService().uid;

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
      final homeContextBloc = GlobalKeys.homeScaffoldKey.currentContext
          ?.read<HomeCubit>();
      int newIncomes = 0;
      int newExpenses = 0;
      final rate = double.parse(
        (GlobalKeys.homeScaffoldKey.currentContext
                    ?.read<HomeCubit>()
                    .state
                    .rate
                    ?.rate ??
                0)
            .toString(),
      );
      if (event.isDeleting) {
        newIncomes = event.isIncome
            ? event.incomes - event.amount
            : event.incomes;
        newExpenses = !event.isIncome
            ? event.expenses - event.amount
            : event.expenses;
      } else if (!event.isUsd) {
        newIncomes = event.isIncome
            ? event.incomes + event.amount
            : event.incomes;
        newExpenses = !event.isIncome
            ? event.expenses + event.amount
            : event.expenses;
      } else {
        newIncomes = event.isIncome
            ? ((event.amount * rate).toInt() + event.incomes)
            : event.incomes;
        newExpenses = !event.isIncome
            ? ((event.amount * rate).toInt() + event.expenses)
            : event.expenses;
      }
      homeContextBloc?.fetchUserTransactions();
      homeContextBloc?.fetchUserData();
      _repository.calculateOverall(
        uid: uid.toString(),
        income: newIncomes,
        expense: newExpenses,
      );
    } catch (e) {
      // Handle error if necessary
    }
  }

  Future<void> _deleteTransaction(
    _DeleteTransaction event,
    Emitter<CreateTransactionState> emit,
  ) async {
    try {
      emit(state.copyWith(isDeletingLoading: true));
      await _repository.deleteTransaction(
        transactionId: event.transaction.id,
        uid: uid ?? "",
      );
      final homeContextBloc = GlobalKeys.homeScaffoldKey.currentContext
          ?.read<HomeCubit>();
      add(
        CreateTransactionEvent.changeOverallSums(
          isUsd: event.transaction.isUsd,
          isDeleting: true,
          isIncome: event.transaction.income,
          amount: event.transaction.amount.replaceAll(",", "") == ""
              ? 0
              : int.parse(event.transaction.amount.replaceAll(",", "")),
          incomes: homeContextBloc?.state.userData?.income ?? 0,
          expenses: homeContextBloc?.state.userData?.expense ?? 0,
        ),
      );

      GlobalKeys.homeScaffoldKey.currentContext
          ?.read<HomeCubit>()
          .deleteTransaction(transactionId: event.transaction.id);
      emit(state.copyWith(isDeletingLoading: false));
      // ignore: use_build_context_synchronously
      Navigator.pop(event.context);
    } catch (e) {
      printLog(e.toString());
    }
  }

  Future<void> _changeTransaction(
    _ChangeTransaction event,
    Emitter<CreateTransactionState> emit,
  ) async {
    emit(state.copyWith(isCreatingLoading: true));
    try {
      await _repository.changeTransaction(
        transaction: event.transaction,
        uid: uid ?? "",
      );
      GlobalKeys.homeScaffoldKey.currentContext
          ?.read<HomeCubit>()
          .changeTransaction(transaction: event.transaction);
      emit(state.copyWith(isCreatingLoading: false));
      // ignore: use_build_context_synchronously
      Navigator.pop(event.context);
    } catch (e) {
      printLog(e.toString());
    }
  }

  Future<void> _addTransaction(
    _CreateTransactionEvent event,
    Emitter<CreateTransactionState> emit,
  ) async {
    try {
      emit(state.copyWith(isCreatingLoading: true));

      await _repository.addTransaction(
        transaction: event.transaction,
        uid: uid.toString(),
      );

      final homeContextBloc = GlobalKeys.homeScaffoldKey.currentContext
          ?.read<HomeCubit>();
      emit(state.copyWith(isSuccess: true, isCreatingLoading: false));
      showAppSnackBar("Transaction added successfully");
      Future.microtask(() {
        add(
          CreateTransactionEvent.changeOverallSums(
            isUsd: event.transaction.isUsd,
            isDeleting: false,
            isIncome: event.transaction.income,
            amount: int.parse(event.transaction.amount.replaceAll(",", "")),
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
