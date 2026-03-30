import 'package:flutter/material.dart';
import '../models/wallpaper_model.dart';

class WallpaperDetail extends StatelessWidget {
  final Datum wallpaper;

  const WallpaperDetail({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallpaper Detail")),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE BESAR
            Hero(
              tag: wallpaper.id ?? "",
              child: Image.network(
                wallpaper.path ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            /// DETAIL DATA
            Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailItem("Category", wallpaper.category ?? "-"),

                  detailItem("Resolution", wallpaper.resolution ?? "-"),

                  detailItem("File Type", wallpaper.fileType ?? "-"),

                  detailItem("Views", wallpaper.views.toString()),

                  detailItem("Favorites", wallpaper.favorites.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget detail row
  Widget detailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),

      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              "$title :",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
