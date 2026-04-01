import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../api/wallpaper_api.dart';
import '../models/wallpaper_model.dart';
import 'category_wallpaper_view.dart'; // ✅ HALAMAN BARU

class WallpaperView extends StatefulWidget {
  const WallpaperView({super.key});

  @override
  State<WallpaperView> createState() => _WallpaperViewState();
}

class _WallpaperViewState extends State<WallpaperView> {
  late Future<Walpaper> futureWallpapers;

  List<Datum> allWallpapers = [];

  /// CONTROLLER SLIDER
  PageController controller = PageController(viewportFraction: 0.55);

  int currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      /// APPBAR TANPA TEXT
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0),

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
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            /// Ambil data API
            allWallpapers = snapshot.data!.data!;

            /// Filter Anime & General
            List<Datum> categoryWallpapers = allWallpapers.where((wallpaper) {
              final category = wallpaper.category?.toLowerCase() ?? "";

              return category == "anime" || category == "general";
            }).toList();

            /// Unique category
            Map<String, Datum> uniqueCategories = {};

            for (var wallpaper in categoryWallpapers) {
              final category = wallpaper.category ?? "";

              if (!uniqueCategories.containsKey(category)) {
                uniqueCategories[category] = wallpaper;
              }
            }

            final categoryList = uniqueCategories.values.toList();

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// FRAME + PAGEVIEW
                  SizedBox(
                    height: 260,

                    child: Stack(
                      alignment: Alignment.center,

                      children: [
                        /// FRAME PUTIH
                        Container(
                          width: 170,
                          height: 220,

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 4),

                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),

                        /// PAGEVIEW
                        PageView.builder(
                          controller: controller,

                          itemCount: categoryList.length,

                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },

                          itemBuilder: (context, index) {
                            final wallpaper = categoryList[index];

                            return AnimatedBuilder(
                              animation: controller,

                              builder: (context, child) {
                                double value = 0;

                                if (controller.position.haveDimensions) {
                                  value = controller.page! - index;
                                }

                                /// SCALE
                                double scale = (1 - (value.abs() * 0.3)).clamp(
                                  0.7,
                                  1.0,
                                );

                                /// CURVE
                                double translateY = (value * value) * 120;

                                return Center(
                                  child: Transform.translate(
                                    offset: Offset(0, translateY),

                                    child: Transform.scale(
                                      scale: scale,

                                      child: GestureDetector(
                                        /// ✅ HANYA CARD TENGAH BISA DIKLIK
                                        onTap: index == currentIndex
                                            ? () {
                                                final selectedCategory =
                                                    wallpaper.category ?? "";

                                                /// FILTER SESUAI CATEGORY
                                                final filteredWallpapers =
                                                    allWallpapers.where((w) {
                                                      return w.category
                                                              ?.toLowerCase() ==
                                                          selectedCategory
                                                              .toLowerCase();
                                                    }).toList();

                                                /// NAVIGATE
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoryWallpaperView(
                                                          category:
                                                              selectedCategory,
                                                          wallpapers:
                                                              filteredWallpapers,
                                                        ),
                                                  ),
                                                );
                                              }
                                            : null,

                                        child: Container(
                                          width: 160,
                                          height: 210,

                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),

                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),

                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),

                                            child: CachedNetworkImage(
                                              imageUrl: wallpaper.path ?? "",

                                              fit: BoxFit.cover,

                                              placeholder: (context, url) =>
                                                  const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),

                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// TEXT CATEGORY
                  if (categoryList.isNotEmpty)
                    Text(
                      categoryList[currentIndex].category ?? "",

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
