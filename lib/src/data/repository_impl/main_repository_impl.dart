import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/data/model/category_model.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

@Injectable(as: MainRepositoryInterface)
class MainRepositoryImpl implements MainRepositoryInterface {
  final _instance = FirebaseFirestore.instance;
  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _instance.collection('categories').get();
    printLog("Categories: ${snapshot.docs.length}");
    return snapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<void> addTransaction({
    required String note,
    required String amount,
    required DateTime date,
    required String category,
    required String uid,
    required bool isUsd,
    required bool isIncome,
  }) async {
    final expense = {
      'amount': amount,
      'category': category,
      'note': note,
      'createdAt': date,
      'isUsd': isUsd,
      "income": isIncome,
    };
    await _instance
        .collection('users')
        .doc(uid)
        .collection('expenses')
        .add(expense);
  }

  @override
  Future<List<CategoryModel>> getCategoriesIncome() async {
    final snapshot = await _instance.collection('categories_income').get();
    printLog("Income Categories: ${snapshot.docs.length}");
    return snapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();
  }
}
