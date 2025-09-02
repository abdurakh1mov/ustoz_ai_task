import 'package:ustoz_ai_task/src/data/model/category_model.dart';

abstract interface class MainRepositoryInterface {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getCategoriesIncome();
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
