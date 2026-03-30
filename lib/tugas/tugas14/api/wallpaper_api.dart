
import 'package:http/http.dart' as http;

import '../models/wallpaper_model.dart';

class WallpaperApi {
  static const String url = "https://wallhaven.cc/api/v1/search";

  static Future<Walpaper> fetchWallpapers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return walpaperFromJson(response.body);
    } else {
      throw Exception("Failed to load wallpapers");
    }
  }
}
