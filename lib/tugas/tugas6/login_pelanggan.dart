import 'package:flutter/material.dart';

class LoginPelanggan extends StatefulWidget {
  const LoginPelanggan({super.key});

  @override
  State<LoginPelanggan> createState() => _LoginPelangganState();
}

class _LoginPelangganState extends State<LoginPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1.9, 0.3),
            radius: 1.3,
            colors: [
              Color(0xff32B2B2), // hijau kiri
              Color(0xffD9D9D9), // abu kanan
            ],
          ),
        ),
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          children: [
            SizedBox(height: 65),
            Center(
              child: SizedBox(
                width: 80,
                child: Image.asset(
                  "assets/images/upscalemedia-transformed (1) (2).png",
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "SERBANEKA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            Container(
              width: 280,
              padding: EdgeInsets.all(5),
              child: Center(
                child: Text(
                  "Kebutuhan sekolah dan harian, kini lebih mudah dan praktis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pelanggan",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff289FA7),
                    ),
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xff32B2B2), // hijau sesuai desain
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Login Pelanggan",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Container(
              width: 280,
              padding: EdgeInsets.all(3),
              child: Center(
                child: Text(
                  "Masukkan kredensial anda untuk melanjutkan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Identitas",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
