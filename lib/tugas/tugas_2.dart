import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Soal no 1  */
      appBar: AppBar(
        title: Text("Profil Toko"), 
        backgroundColor: Color(0xff51cec3),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /* Soal no 2  */
          Center(
            child: 
            Text("Serbaneka", 
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold
             ),
            ),
          ),

        /* Soal no 3  */
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10,),
                Text("Radithya refian"),
              ],
            ),
          ),
        ),
        Container(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.card_giftcard),
                SizedBox(width: 10,),
                Text("12414214"),
              ],
            ),
          ),
        ),
        /* Soal no 4 */
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text("08324824242"),
              Spacer(),
              Text("Jakarta Pusat"),
            ],
          ),
        ),
        ],
      ),
    );
  }
}