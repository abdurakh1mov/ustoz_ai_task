import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

import '../../../data/model/category_model.dart';
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
      emit(state.copyWith(userTransactions: transactions, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await _repository.getCategories();
      List<CategoryModel> incomeCategories = categories
          .where((category) => category.isIncome)
          .toList();
      List<CategoryModel> expenseCategories = categories
          .where((category) => !category.isIncome)
          .toList();
      emit(
        state.copyWith(
          categories: expenseCategories,
          isLoading: false,
          categoriesIncome: incomeCategories,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchCategoriesIncome() async {
    try {
      final categories = await _repository.getCategoriesIncome();
      List<String> types = ["All", "Income", "Expense"];
      List<String> staticDates = [
        "All",
        "Today",
        "Yesterday",
        "Last 7 Days",
        "Last 30 Days",
        "This Month",
        "Last Month",
      ];
      emit(
        state.copyWith(
          categoriesIncome: categories,
          isLoading: false,
          typesList: types,
          staticDatesList: staticDates,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getFilteredTransactions({
    bool? income,
    String? category,
    String? selectedDate,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isIncome: income,
        selectedCategory: category ?? "",
        selectedDate: selectedDate ?? "",
        isFiltered: true,
      ),
    );
    try {
      final uid = DbService().uid;
      DateTime? startDate;
      DateTime? endDate;
      if (state.startDate != null) {
        startDate = DateTime(
          state.startDate!.year,
          state.startDate!.month,
          state.startDate!.day,
        );
      }
      if (state.endDate != null) {
        startDate = DateTime(
          state.startDate!.year,
          state.startDate!.month,
          state.startDate!.day,
          23,
          59,
          59,
          999,
        );
      }
      if (selectedDate == "All") {
        printLog("fsamfkmaksmfaksmfkamsk All");
        startDate = null;
        endDate = null;
      } else if (selectedDate == "Today") {
        printLog("fsamfkmaksmfaksmfkamsk Today");
        final now = DateTime.now();
        startDate = DateTime(now.year, now.month, now.day);
        endDate = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
      } else if (selectedDate == "Yesterday") {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        startDate = DateTime(yesterday.year, yesterday.month, yesterday.day);
        endDate = DateTime(
          yesterday.year,
          yesterday.month,
          yesterday.day,
          23,
          59,
          59,
          999,
        );
      } else if (selectedDate == "Last 7 Days") {
        printLog("fsamfkmaksmfaksmfkamsk Last 7 Days");
        final now = DateTime.now();
        final sevenDaysAgo = now.subtract(const Duration(days: 6));
        startDate = DateTime(
          sevenDaysAgo.year,
          sevenDaysAgo.month,
          sevenDaysAgo.day,
        );
        endDate = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
      } else if (selectedDate == "Last 30 Days") {
        printLog("fsamfkmaksmfaksmfkamsk Last 30 Days");
        final now = DateTime.now();
        final thirtyDaysAgo = now.subtract(const Duration(days: 29));
        startDate = DateTime(
          thirtyDaysAgo.year,
          thirtyDaysAgo.month,
          thirtyDaysAgo.day,
        );
        endDate = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
      } else if (selectedDate == "This Month") {
        printLog("fsamfkmaksmfaksmfkamsk This Month");
        final now = DateTime.now();
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999);
      } else if (selectedDate == "Last Month") {
        printLog("fsamfkmaksmfaksmfkamsk Last Month");
        final now = DateTime.now();
        final lastMonth = DateTime(now.year, now.month - 1, 1);
        startDate = DateTime(lastMonth.year, lastMonth.month, 1);
        endDate = DateTime(
          lastMonth.year,
          lastMonth.month + 1,
          0,
          23,
          59,
          59,
          999,
        );
      }
      printLog("fsamfkmaksmfaksmfkamsk Start date: $startDate");
      final transactions = await _repository.getFilteredTransactions(
        uid: uid ?? "",
        startDate: startDate,
        endDate: endDate,
        income: income,
        category: category == "All" ? null : category,
      );
      printLog("Filtered transactions: ${transactions.length}");
      emit(state.copyWith(userTransactions: transactions, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> changeTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      final transactions = List<TransactionModel?>.from(state.userTransactions);

      final index = transactions.indexWhere((t) => t?.id == transaction.id);

      if (index == -1) {
        printLog("Transaction not found in list");
        return;
      }
      transactions[index] = transaction;

      emit(state.copyWith(userTransactions: transactions));
      printLog("Transaction updated successfully");
    } catch (e) {
      printLog("Error changing transaction: $e");
    }
  }

  Future<void> deleteTransaction({required String transactionId}) async {
    try {
      final transactions = List<TransactionModel?>.from(state.userTransactions);

      final index = transactions.indexWhere((t) => t?.id == transactionId);

      if (index == -1) {
        printLog("Transaction not found in list");
        return;
      }
      transactions.removeAt(index);

      emit(state.copyWith(userTransactions: transactions));
      printLog("Transaction deleted successfully");
    } catch (e) {
      printLog("Error deleting transaction: $e");
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
