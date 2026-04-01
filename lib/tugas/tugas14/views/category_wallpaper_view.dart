import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/wallpaper_model.dart';
import '../views/wallpaper_detail.dart';

class CategoryWallpaperView extends StatefulWidget {
  final String category;
  final List<Datum> wallpapers;

  const CategoryWallpaperView({
    super.key,
    required this.category,
    required this.wallpapers,
  });

  @override
  State<CategoryWallpaperView> createState() => _CategoryWallpaperViewState();
}

class _CategoryWallpaperViewState extends State<CategoryWallpaperView> {
  double itemWidth = 150;
  double itemHeight = 200;
  double spacing = 1;

  final int gridCount = 4;

  Offset gridOffset = Offset.zero;
  Offset dragOffset = Offset.zero;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setInitialCenter();
    });
  }

  void _setInitialCenter() {
    Size size = MediaQuery.of(context).size;

    /// 🔥 DIPERBESAR LAGI BIAR PAS FRAME
    itemWidth = size.width * 0.75;
    itemHeight = itemWidth * 1.3;
    spacing = 12;

    int initialIndex = 5;

    final base = getBasePosition(initialIndex, size);
    final center = Offset(size.width / 2, size.height / 2);

    setState(() {
      gridOffset = center - base;

      /// 🔥 OFFSET KECIL BIAR PERFECT MASUK FRAME
      gridOffset += const Offset(0, -6);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    final items = widget.wallpapers.take(16).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            gridOffset += details.delta;
            dragOffset = details.delta;
          });
        },
        onPanEnd: (_) {
          snapToCenter(screenSize, items.length);
          dragOffset = Offset.zero;
        },
        child: Stack(
          children: [
            ...List.generate(items.length, (index) {
              return _buildItem(index, items[index], screenSize);
            }),

            /// 🔥 FRAME DIPERBESAR
            Center(
              child: Container(
                width: itemWidth,
                height: itemHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 6),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Offset getBasePosition(int index, Size size) {
    int row = index ~/ gridCount;
    int col = index % gridCount;

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double totalWidth = (gridCount * itemWidth) + ((gridCount - 1) * spacing);
    double totalHeight = (gridCount * itemHeight) + ((gridCount - 1) * spacing);

    double startX = centerX - totalWidth / 2;
    double startY = centerY - totalHeight / 2;

    double x = startX + col * (itemWidth + spacing);
    double y = startY + row * (itemHeight + spacing);

    return Offset(x + itemWidth / 2, y + itemHeight / 2);
  }

  Widget _buildItem(int index, Datum wallpaper, Size screenSize) {
    final basePos = getBasePosition(index, screenSize);
    final position = basePos + gridOffset;

    final center = Offset(screenSize.width / 2, screenSize.height / 2);

    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    final distance = sqrt(dx * dx + dy * dy);

    double scale = 1 - (distance / 800);
    scale = scale.clamp(0.7, 1.1);

    double rotateX = dragOffset.dy * 0.003;
    double rotateY = -dragOffset.dx * 0.003;

    return Positioned(
      left: (position.dx - itemWidth / 2).roundToDouble(),
      top: (position.dy - itemHeight / 2).roundToDouble(),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(rotateX)
          ..rotateY(rotateY)
          ..scale(scale),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WallpaperDetail(wallpaper: wallpaper),
              ),
            );
          },
          child: SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                imageUrl: wallpaper.path ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void snapToCenter(Size size, int length) {
    final center = Offset(size.width / 2, size.height / 2);

    double minDistance = double.infinity;
    Offset bestOffset = gridOffset;

    for (int i = 0; i < length; i++) {
      final base = getBasePosition(i, size);
      final pos = base + gridOffset;

      final dx = pos.dx - center.dx;
      final dy = pos.dy - center.dy;

      final dist = sqrt(dx * dx + dy * dy);

      if (dist < minDistance) {
        minDistance = dist;

        bestOffset = center - base;

        /// 🔥 SAMAIN DENGAN INITIAL BIAR KONSISTEN
        bestOffset += const Offset(0, -6);
      }
    }

    setState(() {
      gridOffset = bestOffset;
    });
  }
}
