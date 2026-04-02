class LoginModel {
  String message;
  String token;
  User user;

  LoginModel({required this.message, required this.token, required this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json["message"] ?? "",
      token: json["data"]?["token"] ?? "",
      user: User.fromJson(json["data"]?["user"] ?? {}),
    );
  }
}

class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
    );
  }
}
