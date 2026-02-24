import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_kategori.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_mode.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_persyaratan.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_tanggal_lahir.dart';
import 'package:flutter_ppkd/tugas/tugas7/halaman_waktu_pengingat.dart';
import 'package:flutter_ppkd/tugas/tugas7/profile.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  int _bottomIndex = 0; // Home / Profile
  int _drawerIndex = 0; // menu di Drawer

  final List<Widget> _homePages = const [
    HalamanPersyaratan(),
    HalamanMode(),
    HalamanKategori(),
    HalamanTanggalLahir(),
    HalamanWaktuPengingat(),
  ];

  void _onDrawerTapped(int index) {
    setState(() {
      _drawerIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas 7"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),

      // ===== DRAWER HANYA MUNCUL SAAT HOME =====
      drawer: _bottomIndex == 0
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.pinkAccent),
                    child: Text(
                      'Navigation Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_task),
                    title: const Text('Persyaratan'),
                    selected: _drawerIndex == 0,
                    onTap: () => _onDrawerTapped(0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.mode_night),
                    title: const Text('Mode'),
                    selected: _drawerIndex == 1,
                    onTap: () => _onDrawerTapped(1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.category),
                    title: const Text('Kategori'),
                    selected: _drawerIndex == 2,
                    onTap: () => _onDrawerTapped(2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: const Text('Tanggal Lahir'),
                    selected: _drawerIndex == 3,
                    onTap: () => _onDrawerTapped(3),
                  ),
                  ListTile(
                    leading: const Icon(Icons.timelapse),
                    title: const Text('Waktu Pengingat'),
                    selected: _drawerIndex == 4,
                    onTap: () => _onDrawerTapped(4),
                  ),
                ],
              ),
            )
          : null,

      // ===== BODY =====
      body: _bottomIndex == 0
          ? _homePages[_drawerIndex] // HOME → FORM + DRAWER
          : const HalamanProfile(), // PROFILE → HALAMAN SENDIRI

      // ===== BOTTOM NAVIGATION BAR =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: (index) {
          setState(() {
            _bottomIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}