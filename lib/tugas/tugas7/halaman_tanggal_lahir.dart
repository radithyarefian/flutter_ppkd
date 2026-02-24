import 'package:flutter/material.dart';


class HalamanTanggalLahir extends StatefulWidget {
  const HalamanTanggalLahir({super.key});

  @override
  State<HalamanTanggalLahir> createState() => _HalamanTanggalLahirState();
}

class _HalamanTanggalLahirState extends State<HalamanTanggalLahir> {
   DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Pilih Tanggal Lahir",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
              
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
                child: const Text("Pilih Tanggal"),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            Center(
              child: const Text(
                "Hasil:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                _selectedDate == null
                    ? "Tanggal belum dipilih"
                    : "Tanggal Lahir: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}