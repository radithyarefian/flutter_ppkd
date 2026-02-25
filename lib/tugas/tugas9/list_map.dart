import 'package:flutter/material.dart';

class HalamanListMap extends StatefulWidget {
  const HalamanListMap({super.key});

  @override
  State<HalamanListMap> createState() => _HalamanListMapState();
}

class _HalamanListMapState extends State<HalamanListMap> {
  List<Map<String, dynamic>> detailKategori = [
    {'nama': 'Seragam & Perlengkapan Sekolah', 
     'icon':Icons.checkroom,
     'deskripsi': 'Seragam Sekolah SD.SMP,SMA'
    },

    {'nama': 'Alat Tulis Kantor', 
     'icon':Icons.book_online,
     'deskripsi': 'Menjual kebutuhan alat tulis untuk kantor dan sekolah'
    },

    {'nama': 'Tas & Aksesoris Pribadi', 
     'icon':Icons.backpack,
     'deskripsi': 'Tas Sekolah dan beberapa aksesoris pribadi'
    },

    {'nama': 'Elektronik & Aksesoris Komputer', 
    'icon':Icons.computer,
    'deskripsi': 'bisa Service Laptop'
    },

     {'nama': 'Listrik & Peralatan Rumah Tangga', 
    'icon':Icons.electrical_services,
    'deskripsi': 'Kabel dan lampu '
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detailKategori.length,
      itemBuilder: (BuildContext context, int index) {
        final data = detailKategori[index];
        return ListTile(
          title: Text(data["nama"]),
          leading: Icon(data['icon']),
          subtitle: Text(data['deskripsi']),
        );
      },
    );
  }
}