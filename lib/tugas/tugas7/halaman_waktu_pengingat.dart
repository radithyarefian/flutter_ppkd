import 'package:flutter/material.dart';

class HalamanWaktuPengingat extends StatefulWidget {
  const HalamanWaktuPengingat({super.key});

  @override
  State<HalamanWaktuPengingat> createState() => _HalamanWaktuPengingatState();
}

class _HalamanWaktuPengingatState extends State<HalamanWaktuPengingat> {
   TimeOfDay? selectedTime;

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
                "Atur Pengingat",
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
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime ?? TimeOfDay.now(),
                  );
              
                  if (picked != null) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                },
                child: const Text("Pilih Jam"),
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
                selectedTime == null
                    ? "Waktu belum dipilih"
                    : "Pengingat diatur pukul: ${selectedTime!.format(context)}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}