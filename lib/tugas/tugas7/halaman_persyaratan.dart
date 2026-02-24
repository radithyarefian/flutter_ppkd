import 'package:flutter/material.dart';

class HalamanPersyaratan extends StatefulWidget {
  const HalamanPersyaratan({super.key});

  @override
  State<HalamanPersyaratan> createState() => _HalamanPersyaratanState();
}

class _HalamanPersyaratanState extends State<HalamanPersyaratan> {
  bool _setuju =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: const Text(
                "Syarat & Ketentuan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            const SizedBox(height: 20),

            CheckboxListTile(
              title: const Text(
                "Saya menyetujui semua persyaratan yang berlaku",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              value: _setuju,
              onChanged: (value) {
                setState(() {
                  _setuju = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              ),

              const SizedBox(height: 10),

              const Divider(),
              
              const SizedBox(height: 10),

              Center(
                child: const Text(
                  "status",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                _setuju? 'lanjutkan pendaftaran diperbolehkan': "Anda belum bisa melanjutkan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _setuju ? Colors.green : Colors.red,
                ),
              ),
            )
          ],
        ),
        ),
    );
  }
}