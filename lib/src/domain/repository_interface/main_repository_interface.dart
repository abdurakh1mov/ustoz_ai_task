import 'package:ustoz_ai_task/src/data/model/category_model.dart';
import 'package:ustoz_ai_task/src/data/model/rate_model.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/data/model/user_model.dart';

abstract interface class MainRepositoryInterface {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getCategoriesIncome();
  Future<RateModel> getRate();
  Future<void> calculateOverall({
    required String uid,
    required int income,
    required int expense,
  });
  Future<UserModel> getOverallSums({required String uid});
  Future<List<TransactionModel>> getUserTransactions({required String uid});
  Future<void> addTransaction({
    required String note,
    required String amount,
    required DateTime date,
    required String category,
    required String uid,
    required bool isUsd,
    required bool isIncome,
  });
}
