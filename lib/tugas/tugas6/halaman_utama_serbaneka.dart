import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas6/login_pelanggan.dart';

class HalamanUtamaSerbaneka extends StatelessWidget {
  const HalamanUtamaSerbaneka({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffBCDBDB), Color(0xff647575)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Serbaneka",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 300),
              Text(
                "Kuliah ? BSI azaa...",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 330),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPelanggan(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff32B2B2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lanjutkan Ke Aplikasi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
