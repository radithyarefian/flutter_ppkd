import 'package:flutter/material.dart';
import 'package:flutter_ppkd/extension/navigator.dart';
import 'package:flutter_ppkd/tugas/tugas11/database/preference.dart';
import 'package:flutter_ppkd/tugas/tugas11/view/login_screen.dart';
import 'package:flutter_ppkd/tugas/tugas6/login_pelanggan.dart';
import 'package:flutter_ppkd/tugas/tugas7/tugas_7.dart';
import 'package:flutter_ppkd/tugas/tugas9/tugas9.dart';

class HalamanSplashScreen extends StatefulWidget {
  const HalamanSplashScreen({super.key});

  @override
  State<HalamanSplashScreen> createState() => _HalamanSplashScreenState();
}
 

class _HalamanSplashScreenState extends State<HalamanSplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

    void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai, Joshua");
    if (data == true) {
      context.pushAndRemoveAll(Tugas9());
    } else {
      context.pushAndRemoveAll(LoginScreenDay16());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png")
        ],
      ),
    );
    
  }
}