import 'package:flutter/material.dart';
import 'package:flutter_ppkd/extension/navigator.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emaiController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isVisibility = false;
  void visibilityOnOf() {
    _isVisibility = !_isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Lengkap ",
                    labelText: 'Nama Lengkap',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Wajib Diisi';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: emaiController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Email Anda  ",
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Wajib Diisi';
                    } else if (!value.contains('@')) {
                      return 'Format Email tidak valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  obscureText: _isVisibility,
                  obscuringCharacter: ".",
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Password Anda",
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: InkWell(
                      onTap: visibilityOnOf,
                      child: Icon(
                        !_isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Wajib Diisi';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: nohpController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nomor HP Anda",
                    labelText: 'Nomor HP',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor HP Wajib Diisi';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {  
                        print("Berhasil Tervalidasi");
                        if (emaiController.text != "1234@gmail.com") {
                          print("Email Salah");
                          DialogError(context);
                        }
                      } else {
                      print("Tidak Berhasil Tervalidasi");
                      }
                      print(emaiController.text);
                      print(passwordController);
                    },
                    child: Text("Daftar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> DialogError(BuildContext context) {
    return showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text(
                                "Data",
                                style: TextStyle(fontSize: 25),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("email yang anda masukan salah"),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text("kembali"),
                                ),
                              ],
                            );
                          },
                        );
  }
}
