class ProfileModel {
  String message;
  User? user;

  ProfileModel({required this.message, this.user});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      message: json["message"] ?? "",

      // ✅ Ambil dari json["data"]
      user: json["data"] != null ? User.fromJson(json["data"]) : null,
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
