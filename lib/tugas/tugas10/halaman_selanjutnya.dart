import 'package:flutter/material.dart';

class HalamanSelanjutnya extends StatelessWidget {
  const HalamanSelanjutnya({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Halo $text"))
        ],
      ),
    );
  }
}