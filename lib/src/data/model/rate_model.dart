class RateModel {
  final String rate;

  RateModel({required this.rate});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(rate: json['Rate'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'Rate': rate};
  }
}
