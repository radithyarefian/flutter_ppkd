import 'package:flutter/material.dart';

class HalamanMode extends StatefulWidget {
  const HalamanMode({super.key});

  @override
  State<HalamanMode> createState() => _HalamanModeState();
}

class _HalamanModeState extends State<HalamanMode> {
  bool _isdarkmode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isdarkmode ? Colors.black : Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Mode Gelap",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _isdarkmode ? Colors.white : Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SwitchListTile(
              title: Text(
                "Aktifkan Mode Gelap",
                style: TextStyle(
                  color:  _isdarkmode ? Colors.white : Colors.black,
                ),
              ),
              value: _isdarkmode,
              onChanged: (value) {
                setState(() {
                  _isdarkmode = value;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 30),
            
            const Divider(),

            const SizedBox(height: 10),

            Center(
              child: Text(
                "Status",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _isdarkmode ? Colors.white : Colors.black,
                ),
              ),
            ),

             const SizedBox(height: 10),

             Center(
               child: Text(
                _isdarkmode ? "Mode Gelap Aktif":"Mode Terang Aktif",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _isdarkmode ? Colors.greenAccent:Colors.blueAccent,
                ),
               ),
             )
          ],
        ),
        ),
    );
  }
}