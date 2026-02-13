import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Soal no 1 (Header Halaman)  */
      appBar: AppBar(
        title: Text("Profil Toko"), 
        backgroundColor: Color(0xff51cec3),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /* Soal no 2 ( Identitas Utama) */
          Center(
            child: 
            Text("Serbaneka", 
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold
             ),
            ),
          ),

        /* Soal no 3 (Detail Kontak/Informasi ) */
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10,),
                Text("Radithya refian"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.card_giftcard),
                SizedBox(width: 10,),
                Text("12414214"),
              ],
            ),
          ),
        ),
        /* Soal no 4 (Aksi/Informasi Pendukung)*/
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
        /* Soal no 5 ( Area Statistik Horizontal) */
        Padding(
          padding: EdgeInsets.all(25.0),
        child: Container(
          child: Row(
            children: [
              Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(30)
                  ),
                child: Text("Instagram",
                textAlign: TextAlign.center,
                ),
              ),
              ),
              Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30)
                  ),
                child: Text("Youtube",
                textAlign: TextAlign.center,
                ),
              ),
              ),
              Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                  ),
                child: Text("Facebook",
                textAlign: TextAlign.center,
                ),
              ),
              )
            ],
          ),
        ),
        ),
        /* Soal no 6 (Deskripsi Naratif) */
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black
            ),
            child: Text(
              "Serbaneka adalah toko keluarga yang menyediakan kebutuhan sekolah, alat tulis kantor, perlengkapan listrik, serta layanan fotokopi dan print dalam satu tempat. Dengan konsep lengkap dan harga terjangkau, Serbaneka hadir untuk memudahkan masyarakat memenuhi kebutuhan sehari-hari secara praktis dan efisien.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
              ),
          ),
          ),
        /* Soal no 7 (Visual Branding) */
        Container(
          child: Column(
            children: [
              Image.asset(
                "assets/images/3.png",
                width: 200,
                ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}