import 'package:flutter/material.dart';

class HalamanList extends StatefulWidget {
  const HalamanList({super.key});

  @override
  State<HalamanList> createState() => _HalamanListState();
}

class _HalamanListState extends State<HalamanList> {
  final List<String> kategori = [
    "Seragam & Perlengkapan Sekolah",
    "Alat Tulis Kantor",
    "Tas & Aksesoris Pribadi",
    "Elektronik & Aksesoris Komputer",
    "Listrik & Peralatan Rumah Tangga"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
         title: Text(kategori[index]),
        );
      },
    );

  }
}