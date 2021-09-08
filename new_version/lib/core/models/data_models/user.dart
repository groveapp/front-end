class User {
  final int? id;
  final String email;
  final int security;

  User({this.id, required this.email, required this.security});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'], email: json['email'], security: json['security']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['security'] = this.security;
    return data;
  }
}
