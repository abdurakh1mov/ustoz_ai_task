class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final int income;
  final int expense;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    required this.income,
    required this.expense,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photoURL: json['photoURL'] ?? '',
      income: json['income'] ?? 0,
      expense: json['expense'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoURL': photoURL,
      'income': income,
      'expense': expense,
    };
  }
}
