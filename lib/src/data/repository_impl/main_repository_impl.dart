import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/data/model/category_model.dart';
import 'package:ustoz_ai_task/src/data/model/rate_model.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

import '../model/user_model.dart';

@Injectable(as: MainRepositoryInterface)
class MainRepositoryImpl implements MainRepositoryInterface {
  final _instance = FirebaseFirestore.instance;
  final Dio dio = Dio();
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
    final expenseRef = _instance
        .collection('users')
        .doc(uid)
        .collection('expenses')
        .doc();

    final expense = {
      'id': expenseRef.id,
      'amount': amount,
      'category': category,
      'note': note,
      'createdAt': DateFormat('yyyy-MM-dd HH:mm').format(date),
      'isUsd': isUsd,
      'income': isIncome,
    };

    await expenseRef.set(expense);
  }

  @override
  Future<List<CategoryModel>> getCategoriesIncome() async {
    final snapshot = await _instance.collection('categories_income').get();
    printLog("Income Categories: ${snapshot.docs.length}");
    return snapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<TransactionModel>> getUserTransactions({
    required String uid,
  }) async {
    final snapshot = await _instance
        .collection('users')
        .doc(uid)
        .collection('expenses')
        // .orderBy('createdAt', descending: true)
        .get();
    printLog("User Transactions: ${snapshot.docs.length}");
    return snapshot.docs
        .map((doc) => TransactionModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<RateModel> getRate() async {
    final response = await dio.get(
      'https://cbu.uz/uz/arkhiv-kursov-valyut/json/',
    );
    final data = response.data as List;
    final rate = data.firstWhere((element) => element['Ccy'] == 'USD');
    printLog("Rate: $rate");
    return RateModel.fromJson(rate);
  }

  @override
  Future<void> calculateOverall({
    required String uid,
    required int expense,
    required int income,
  }) {
    try {
      final userDoc = _instance.collection('users').doc(uid);
      return userDoc.update({'income': income, 'expense': expense});
    } catch (e) {
      throw Exception('Error updating overall sums: $e');
    }
  }

  @override
  Future<UserModel> getOverallSums({required String uid}) {
    final userDoc = _instance.collection('users').doc(uid);
    return userDoc.get().then((doc) {
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      } else {
        throw Exception('User not found');
      }
    });
  }
}
