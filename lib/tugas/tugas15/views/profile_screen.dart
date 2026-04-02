import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas15/api/api_service.dart';
import 'package:flutter_ppkd/tugas/tugas15/models/profile_model.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ProfileModel> profile;

  @override
  void initState() {
    super.initState();
    profile = ApiService.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: FutureBuilder<ProfileModel>(
        future: profile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Data user kosong"));
          }

          var data = snapshot.data!;
          var user = data.user;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${user?.name ?? "-"}"),
                Text("Email: ${user?.email ?? "-"}"),

                const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(data: user),
                      ),
                    );

                    // ✅ Reload profile
                    setState(() {
                      profile = ApiService.getProfile();
                    });
                  },
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
