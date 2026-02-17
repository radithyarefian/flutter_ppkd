import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(
              labelText: 'nama',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              labelText: 'No HP',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              labelText: 'Alamat',
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
              buildListTileBlue(),
              SizedBox(height: 7,),
              buildListTileRed(),
              SizedBox(height: 7,),
              buildListTileBlue(),
              SizedBox(height: 7,),
              buildListTileRed(),
              SizedBox(height: 7,),
              buildListTileBlue(),
              SizedBox(height: 7,),
              buildListTileRed(),
              SizedBox(height: 7,),
              buildListTileBlue(),
              SizedBox(height: 7,),
              buildListTileRed(),
              ],
            ),
            ),
          ], 
        ),

        
      ),
    );
  }

  Container buildListTileRed() {
    return Container(
        color: Colors.red,
        child: ListTile(
          leading: Image.asset("assets/images/3.png"),
          title: Text("Seragam"),
          subtitle: Text("Atasan Seragam SD no 9"),
        ),
      );
  }

  Container buildListTileBlue() {
    return Container(
        color: Colors.blue,
        child: ListTile(
          leading: Image.asset("assets/images/3.png"),
          title: Text("Seragam"),
          subtitle: Text("Atasan Seragam SD no 9"),
        ),
      );
  }
}