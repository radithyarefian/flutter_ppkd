import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/Tugas11Saya/database/ppkd_controller.dart';
import 'package:flutter_ppkd/tugas/tugas11Saya/models/ppkd_model.dart';

class HasilForm extends StatefulWidget {
  const HasilForm({super.key});

  @override
  State<HasilForm> createState() => _HasilFormState();
}

class _HasilFormState extends State<HasilForm> {
  late List<PpkdModel> dataPpkd = [];

  @override
  void initState() {
    super.initState();
    getDataPpkd();
  }

  Future<void> getDataPpkd() async {
    await Future.delayed(Duration(seconds: 2));
    dataPpkd = await PpkdController.getAllPpkd();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataPpkd.isEmpty || dataPpkd == []
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: dataPpkd.length,
              itemBuilder: (BuildContext context, int index) {
                final items = dataPpkd[index];
                return ListTile(
                  title: Text(items.nama),
                  subtitle: Text(items.jurusan),
                );
              },
            ),
    );
  }
}
