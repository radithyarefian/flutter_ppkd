import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas9/data/data_final.dart';

class HalamanModel extends StatefulWidget {
  const HalamanModel({super.key});

  @override
  State<HalamanModel> createState() => _HalamanModelState();
}

class _HalamanModelState extends State<HalamanModel> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataMentah.length,
      itemBuilder: (context, index) {
        final item = dataMentah[index];

        return ListTile(
          leading: Image.network(item.gambar ?? ''),
          title: Text(item.kategori ?? ''),
          subtitle: Text(item.subKategori ?? ''),
        );
      },
    );
  }
}
