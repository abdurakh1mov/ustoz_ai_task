class CategoryModel {
  final String title;
  final bool isIncome;
  CategoryModel({required this.isIncome, required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      isIncome: json['is_income'] as bool,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, "is_income": isIncome};
  }
}
