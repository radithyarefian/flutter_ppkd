import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas15/api/api_service.dart';

class EditProfileScreen extends StatefulWidget {
  final dynamic data;

  const EditProfileScreen({super.key, required this.data});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    // ✅ PERBAIKAN DISINI
    nameController = TextEditingController(text: widget.data?.name ?? "");

    emailController = TextEditingController(text: widget.data?.email ?? "");
  }

  void updateProfile() async {
    await ApiService.updateProfile(nameController.text, emailController.text);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Update berhasil")));

    setState(() {});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: updateProfile,
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
