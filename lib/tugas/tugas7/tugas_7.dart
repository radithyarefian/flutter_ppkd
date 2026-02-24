import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_kategori.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_mode.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_persyaratan.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_tanggal_lahir.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_waktu_pengingat.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  int _selectedIndex= 0;

  final List <Widget> _widgetOptions = <Widget> [
    const HalamanPersyaratan(),
    const HalamanMode(),
    const HalamanKategori(),
    const HalamanTanggalLahir(),
    const HalamanWaktuPengingat(),
    
  ];

  void _onitemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Tugas 7"),
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
                child: Text(
                  'Navigation Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),
                ),
              ),
              ListTile(
                leading:  const Icon(Icons.add_task),
                title: const Text('Persyaratan'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onitemtapped(0);
                },
              ),
              ListTile(
                leading:  const Icon(Icons.mode_night),
                title: const Text('Mode'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onitemtapped(1);
                },
              ),
              ListTile(
                leading:  const Icon(Icons.category),
                title: const Text('Kategori'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onitemtapped(2);
                },
              ),
              ListTile(
                leading:  const Icon(Icons.date_range),
                title: const Text('Tanggal Lahir'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onitemtapped(3);
                },
              ),
               ListTile(
                leading:  const Icon(Icons.timelapse),
                title: const Text('Waktu Pengingat'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onitemtapped(4);
                },
              )
            ]
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
    );
  }
}