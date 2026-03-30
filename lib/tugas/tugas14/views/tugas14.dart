import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'wallpaper_detail.dart';
import '../api/wallpaper_api.dart';
import '../models/wallpaper_model.dart';

class WallpaperView extends StatefulWidget {
  const WallpaperView({super.key});

  @override
  State<WallpaperView> createState() => _WallpaperViewState();
}

class _WallpaperViewState extends State<WallpaperView> {
  late Future<Walpaper> futureWallpapers;

  List<Datum> allWallpapers = [];
  List<Datum> filteredWallpapers = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    futureWallpapers = WallpaperApi.fetchWallpapers();
  }

  /// REFRESH DATA
  Future<void> refreshData() async {
    setState(() {
      futureWallpapers = WallpaperApi.fetchWallpapers();
    });
  }

  /// FILTER SEARCH
  void filterSearch(String query) {
    final results = allWallpapers.where((wallpaper) {
      final category = wallpaper.category?.toLowerCase() ?? "";

      return category.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredWallpapers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallpaper API")),

      body: RefreshIndicator(
        onRefresh: refreshData,

        child: FutureBuilder<Walpaper>(
          future: futureWallpapers,

          builder: (context, snapshot) {
            /// Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            /// Error
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            /// Ambil data
            allWallpapers = snapshot.data!.data!;

            /// Default tampil semua
            if (filteredWallpapers.isEmpty && searchController.text.isEmpty) {
              filteredWallpapers = allWallpapers;
            }

            return Column(
              children: [
                /// SEARCH BAR
                Padding(
                  padding: const EdgeInsets.all(8),

                  child: TextField(
                    controller: searchController,

                    onChanged: filterSearch,

                    decoration: InputDecoration(
                      hintText: "Cari kategori...",

                      prefixIcon: const Icon(Icons.search),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                /// GRID LIST
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: GridView.builder(
                      itemCount: filteredWallpapers.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.65,
                          ),

                      itemBuilder: (context, index) {
                        final wallpaper = filteredWallpapers[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                    WallpaperDetail(wallpaper: wallpaper),
                              ),
                            );
                          },

                          child: Card(
                            elevation: 4,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                /// IMAGE (CACHE VERSION)
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),

                                    child: CachedNetworkImage(
                                      imageUrl: wallpaper.path ?? "",

                                      width: double.infinity,

                                      fit: BoxFit.cover,

                                      /// Loading image
                                      placeholder: (context, url) =>
                                          const Center(
                                            child: CircularProgressIndicator(),
                                          ),

                                      /// Error image
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),

                                /// TEXT
                                Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      /// CATEGORY
                                      Text(
                                        wallpaper.category ?? "Unknown",

                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      /// RESOLUTION
                                      Text(
                                        wallpaper.resolution ?? "-",

                                        style: const TextStyle(
                                          color: Colors.grey,

                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
