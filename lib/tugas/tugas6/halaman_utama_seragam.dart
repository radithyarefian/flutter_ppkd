import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas6/halaman_utama_atk.dart';
import 'package:flutter_ppkd/tugas/tugas6/halaman_utama_serbaneka.dart';

class HalamanUtamaSeragam extends StatelessWidget {
  const HalamanUtamaSeragam({super.key});

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
                children: [
                  SizedBox(width: 110),
                  Text(
                    "Perlengkapan Sekolah",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HalamanUtamaSerbaneka(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 65),
              Icon(Icons.school, size: 55),
              SizedBox(height: 30),
              Text(
                "Siap untuk Sekolah?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 280,
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "Temukan pilihan yang tepat untuk tahun ajaran baru dengan koleksi lengkap seragam dan sepatu kami",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Bagian yang Kosong ini Masih Develop karena saya sudah muak 😴",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 200),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HalamanUtamaAtk(),
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
                        "Langkah Berikutnya",
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
