import 'package:flutter/material.dart';
import 'package:flutter_ppkd/extension/navigator.dart';
import 'package:flutter_ppkd/tugas/tugas11/utils/decoration_form.dart';
import 'package:flutter_ppkd/tugas/tugas11Saya/database/ppkd_controller.dart';
import 'package:flutter_ppkd/tugas/tugas11Saya/models/ppkd_model.dart';
import 'package:flutter_ppkd/tugas/tugas11Saya/view/hasil_form.dart';

class HalamanForm extends StatefulWidget {
  const HalamanForm({super.key});

  @override
  State<HalamanForm> createState() => _HalamanFormState();
}

class _HalamanFormState extends State<HalamanForm> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Lengkap",
                    labelText: 'Nama',
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Nama Wajib Diisi';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: jurusanController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Jurusan ",
                    labelText: 'Jurusan',
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Jurusan Wajib Diisi';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (namaController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Nama belum di isi")),
                        );
                        return;
                      }
                      if (jurusanController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Jurusan belum di isi")),
                        );
                        return;
                      }
                      PpkdController.registerPpkd(
                        PpkdModel(
                          nama: namaController.text,
                          jurusan: jurusanController.text,
                        ),
                      );
                      namaController.clear();
                      jurusanController.clear();
                      setState(() {});
                    },
                    child: Text("Tambah"),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(HasilForm());
                    },
                    child: Text("Lihat Data"),
                  ),
                ),
                SizedBox(height: 25),
                Center(child: Row(children: [Text("Data PPKD")])),
                SizedBox(height: 12),
                FutureBuilder<List<PpkdModel>>(
                  future: PpkdController.getAllPpkd(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    final dataPpkd = snapshot.data as List<PpkdModel>;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dataPpkd.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = dataPpkd[index];
                        return ListTile(
                          title: Text(items.nama),
                          subtitle: Text(items.jurusan),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  await showEditDialog(context, items);
                                  //dataPpkd = await PpkdController.getAllPpkd();
                                  setState(() {});
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  await showDeleteDialog(context, items.id!);
                                  //dataPpkd = await PpkdController.getAllPpkd();
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showEditDialog(BuildContext context, PpkdModel items) async {
    final namaController = TextEditingController(text: items.nama);
    final jurusanController = TextEditingController(text: items.jurusan);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Nama"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: namaController,
                decoration: decorationConstant(hintText: "Nama"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: jurusanController,
                decoration: decorationConstant(hintText: "jurusan"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await PpkdController.updatePpkd(
                  PpkdModel(
                    id: items.id,
                    nama: namaController.text,
                    jurusan: jurusanController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Nama di update")));
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              child: Text("Hapus bae"),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await PpkdController.deletePpkd(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data berhasil dihapus")));
      setState(() {});
    }
  }
}
