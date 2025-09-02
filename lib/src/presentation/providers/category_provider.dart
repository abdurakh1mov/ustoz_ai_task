import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/data/model/category_model.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';

class CategoryProvider extends ChangeNotifier {
  final MainRepositoryInterface _repository;
  CategoryProvider({required MainRepositoryInterface repository})
    : _repository = repository;
  final List<CategoryModel> categories = [];

  Future<void> setCategories() async {
    final response = await _repository.getCategories();
    categories.clear();
    categories.addAll(response);
    notifyListeners();
  }

  void addCategory(CategoryModel category) {
    categories.add(category);
    notifyListeners();
  }

  // void removeCategory(String id) {
  //   _categories.removeWhere((c) => c.id == id);
  //   notifyListeners();
  // }
}
