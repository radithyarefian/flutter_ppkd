import 'package:flutter/material.dart';
import 'package:flutter_ppkd/extension/navigator.dart';
import 'package:flutter_ppkd/tugas/tugas11/database/preference.dart';
import 'package:flutter_ppkd/tugas/tugas11/database/sqflite.dart';
import 'package:flutter_ppkd/tugas/tugas11/models/user_model.dart';
import 'package:flutter_ppkd/tugas/tugas7/tugas_7.dart';

class LoginScreenDay16 extends StatefulWidget {
  const LoginScreenDay16({super.key});

  @override
  State<LoginScreenDay16> createState() => _LoginScreenDay16State();
}

class _LoginScreenDay16State extends State<LoginScreenDay16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                "Masuk ke Akun Anda",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Lanjutkan aksi kebaikanmu hari ini",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 20),

              Text(
                "Email atau Nomor Telepon",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: decorationConstant(hintText: "nama@email.com"),
              ),
              SizedBox(height: 16),

              Text(
                "Kata Sandi",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(height: 8),

              TextFormField(
                controller: passwordController,
                decoration: decorationConstant(hintText: "••••••••"),
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Lupa Kata Sandi?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    final UserModel? login = await DBHelper.loginUser(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (login != null) {
                      PreferenceHandler().storingIsLogin(true);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Login Berhasil")));
                      await Future.delayed(Duration(seconds: 2));
                      context.push(Tugas7());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Login gagal, email atau password tidak terdaftar",
                          ),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.login, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: BorderSide(color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    var dataIsLogin = PreferenceHandler.getIsLogin();
                    print(dataIsLogin);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/image 1.png", height: 24),
                      SizedBox(width: 8),
                      Text(
                        "Lanjut with Google",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: BorderSide(color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    DBHelper.registerUser(
                      UserModel(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("yoyo whatsap bro")));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/image 1.png", height: 24),
                      SizedBox(width: 8),
                      Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Belum punya akun? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        TextSpan(
                          text: "Daftar",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration decorationConstant({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
