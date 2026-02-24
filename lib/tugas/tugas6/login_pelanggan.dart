import 'package:flutter/material.dart';

class LoginPelanggan extends StatefulWidget {
  const LoginPelanggan({super.key});

  @override
  State<LoginPelanggan> createState() => _LoginPelangganState();
}

class _LoginPelangganState extends State<LoginPelanggan> {
  bool _ingatSaya = false;
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
            SizedBox(height: 40),
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
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 75),
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
            Padding(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Identitas",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email atau Username",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      contentPadding: EdgeInsets.symmetric(vertical: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide (
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "Kata Sandi",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Masukkan kata sandi",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  contentPadding: EdgeInsets.symmetric(vertical: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide (
                          color: Colors.black,
                          width: 1,
                        ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 18),
              child: Row(
                children: [
                    Checkbox(
                      value: false, 
                      onChanged: (bool? newValue) {
                      }
                      ),
                    Text(
                      "Ingat saya",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      ),
                    SizedBox(width: 145),
                    Text(
                      "Lupa Sandi?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xff289FA7)
                      ),
                      )
                ],
              ),
            ),
          GestureDetector(
                onTap: () {
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
    );
  }
}
