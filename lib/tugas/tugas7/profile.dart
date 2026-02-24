import 'package:flutter/material.dart';

class HalamanProfile extends StatelessWidget {
  const HalamanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Aplikasi Form Input Flutter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            Text(
              'Aplikasi ini dibuat sebagai tugas praktikum Flutter. '
              'Aplikasi ini menampilkan berbagai komponen input seperti '
              'checkbox, switch, dropdown, date picker, dan time picker '
              'yang diatur menggunakan Drawer dan BottomNavigationBar.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 12),

            Text(
              'Nama Pembuat :  Prof Radithya refian M.kom S.kom',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8),

            Text(
              'Versi Aplikasi: 1.0.0',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}