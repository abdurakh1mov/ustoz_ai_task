import 'package:ustoz_ai_task/src/data/model/category_model.dart';

abstract interface class MainRepositoryInterface {
  Future<List<CategoryModel>> getCategories();
}
