import 'dart:convert';
import 'package:flutter_ppkd/tugas/tugas11/database/preference.dart';
import 'package:flutter_ppkd/tugas/tugas15/models/profile_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://absensib1.mobileprojp.com/api";

  // REGISTER
  static Future register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),

      headers: {"Accept": "application/json"},

      body: {"name": name, "email": email, "password": password},
    );

    print("REGISTER STATUS: ${response.statusCode}");
    print("REGISTER BODY: ${response.body}");

    return json.decode(response.body);
  }

  // LOGIN
  static Future login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      String token = data["data"]["token"];
      await PreferenceHandler.saveToken(token);

      // ✅ Tambahkan token di root supaya LoginScreen bisa pakai response["token"]
      data["token"] = token;
    }

    return data;
  }

  // GET PROFILE
  static Future<ProfileModel> getProfile() async {
    String? token = await PreferenceHandler.getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/profile"),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("PROFILE STATUS: ${response.statusCode}");
    print("PROFILE BODY: ${response.body}");

    var data = json.decode(response.body);

    return ProfileModel.fromJson(data);
  }

  // UPDATE PROFILE
  static Future updateProfile(String name, String email) async {
    String? token = await PreferenceHandler.getToken();

    final response = await http.put(
      Uri.parse("$baseUrl/profile"),

      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},

      body: {"name": name, "email": email},
    );

    print("UPDATE STATUS: ${response.statusCode}");
    print("UPDATE BODY: ${response.body}");

    return json.decode(response.body);
  }
}
