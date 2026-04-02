import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas15/api/api_service.dart';
import 'package:flutter_ppkd/tugas/tugas15/views/profile_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      print("LOGIN DIKLIK");

      var response = await ApiService.login(
        emailController.text,
        passwordController.text,
      );

      print("LOGIN RESPONSE:");
      print(response);

      // ✅ Cek token di data
      if (response["data"] != null && response["data"]["token"] != null) {
        print("TOKEN ADA: ${response["data"]["token"]}");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      } else {
        print("TOKEN TIDAK ADA");

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response["message"].toString())));
      }
    }
  }
  void goRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: emailController,

                decoration: const InputDecoration(labelText: "Email"),

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email kosong";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(labelText: "Password"),

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password kosong";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: handleLogin,
                child: const Text("Login"),
              ),

              TextButton(onPressed: goRegister, child: const Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}
