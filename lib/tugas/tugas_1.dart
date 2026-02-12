import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Profil Pribadi"),
      backgroundColor: Color(0xff00AA5B),
      centerTitle: true,
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Text("Nama Lengkap : Radithya refian", style: TextStyle(fontSize: 30),),
        Row(
          children: [
            Icon(Icons.location_on),
            Text("Jakarta"),
          ]
        ),
        Text("Saya Adalah Seorang App Developer", style: TextStyle(fontSize: 20),),
        Image.asset("assets/images/ejen ali.jpg")
        ],
      ),

      
      
    );
  }
}