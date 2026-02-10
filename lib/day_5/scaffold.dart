import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00AA5B),
        title: Text("PPKD Batch 5"),
        centerTitle: true,
        ),
      
      body: Text("halo"),
      backgroundColor: Color(0xff1F3A5F),
    );
  }
}