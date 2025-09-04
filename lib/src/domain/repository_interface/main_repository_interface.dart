import 'package:ustoz_ai_task/src/data/model/category_model.dart';
import 'package:ustoz_ai_task/src/data/model/rate_model.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/data/model/user_model.dart';

abstract interface class MainRepositoryInterface {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getCategoriesIncome();
  Future<void> changeTransaction({
    required TransactionModel transaction,
    required String uid,
  });
  Future<RateModel> getRate();
  Future<void> calculateOverall({
    required String uid,
    required int income,
    required int expense,
  });
  Future<void> deleteTransaction({
    required String transactionId,
    required String uid,
  });
  Future<UserModel> getOverallSums({required String uid});
  Future<List<TransactionModel>> getUserTransactions({required String uid});
  Future<void> addTransaction({
    required TransactionModel transaction,
    required String uid,
  });
}
