import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
          // 4 buah text field
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'No HP',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Alamat',
              ),
            ),
          GridView.count(
            crossAxisCount:2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true, // WAJIB (mengatur tinggin grid sesuai isi )
            physics: NeverScrollableScrollPhysics(), // WAJIB (grid tidak bisa di scroll karena sudah ada SingleChildScrollView biar tidak bentrok)
              children: [
              buildGridYellow(),
              buildGridRed(),
              buildGridYellow(),
              buildGridRed(),
              buildGridYellow(),
              buildGridRed(),
              Stack(
                children: [
                  Container(color:  Colors.amber),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Text("20%",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                ],
              ),
              Stack(
                children: [
                  Container(color:  Colors.red),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Text("20%",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                ],
              ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }

  Stack buildGridRed() {
    return Stack(
              children: [
                Container(color:  Colors.red),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Text("20%",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
              ],
            );
  }

  Stack buildGridYellow() {
    return Stack(
              children: [
                Container(color:  Colors.amber),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Text("20%",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
              ],
            );
  }
}