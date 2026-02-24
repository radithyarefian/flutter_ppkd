import 'package:flutter/material.dart';

class HalamanKategori extends StatefulWidget {
  const HalamanKategori({super.key});

  @override
  State<HalamanKategori> createState() => _HalamanKategoriState();
}

class _HalamanKategoriState extends State<HalamanKategori> {
  String? _kategoriTerpilih;

  final List<String> _daftarKategori = [
    'Fortuner',
    'Pajero Sport',
    'Hyundai Palisade',
    'BMW X6',
    'Lainnya',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // ================= judul ===============
            Center(
              child: const Text(
                "Pilih Mobil Anda",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================== Dropdown ================
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Mobil',
                border: OutlineInputBorder(),
              ),
              initialValue: _kategoriTerpilih,
              items: _daftarKategori.map((kategori) {
                return DropdownMenuItem<String>(
                  value: kategori,
                  child: Text(kategori),
                  );
              }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kategoriTerpilih = value;
                  });
                }
              ),

              const SizedBox(height: 30),
            // ================== Hasil ===================
            const Divider(),
            const SizedBox(height: 10),

            Center(
              child: const Text(
                "Hasil Pilihan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                _kategoriTerpilih == null ? 'Belum ada kategori dipilih' : 'anda memilih kategori: $_kategoriTerpilih',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        ),
    );
  }
}