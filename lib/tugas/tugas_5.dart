import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool deskripsi = false;
  bool iconfirst = false;
  bool text = false;
  bool logo = false;
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SERBANEKA"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove_circle),
        onPressed: () {
           setState(() {});
           _counter--;
           print("$_counter");
        },
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ElevatedButton(onPressed: () {
            setState(() {});
            deskripsi = !deskripsi;
            print("Tombol Logo Serbaneka ditekan");
            }, 
            child: Text("Detail Toko"),
            ),
          if (deskripsi)
          Text("Menjual perlengkapan sekolah"),

          SizedBox(height: 15),

          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.phone_android,
                  color: iconfirst ? Colors.red : Colors.black,
                  ),
                onPressed: () {
                  setState(() {});
                  iconfirst = !iconfirst;
                  print("Ikon phone diklik");
                },
                ),
                 if (iconfirst)
                Text("0879-4355-3244")
            ],
          ),
          
          TextButton(onPressed: () {
            setState(() {});
            text = !text;
            print("Text diklik");
            }, 
            child: Text("Deskripsi"),
            ),
          if (text)
          Text("Menjual perlengkapan sekolah sgfsfgsgfsd"),

          InkWell(
            onTap: () {
            setState(() {});
            logo = !logo;
            print("Logo diklik");
            },
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset(
              "assets/images/3.png",
            ),
          ),
        ),
        if (logo)
        Center(child: Text("logo dimulai")),
      
      GestureDetector(
        onTap: () {
          setState(() {});
          _counter++;
          print("angka ke - $_counter");
        },
        onDoubleTap: () {
          setState(() {});
          _counter+=2;
          print("angka ke - $_counter");
        },
        onLongPress: () {
           setState(() {});
          _counter+=3;
          print("angka ke - $_counter");
        },
        child: Center(
          child: Column(
            children: [
              Text("$_counter"),
              Container(
                padding: EdgeInsets.all(16),
                child: Text("TOMBOL"),
              ),
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