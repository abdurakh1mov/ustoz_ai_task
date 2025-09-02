class CategoryModel {
  final String title;

  CategoryModel({required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(title: json['title'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}
