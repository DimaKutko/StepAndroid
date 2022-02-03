import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:homework12/network/rest_client.dart';

class WallpaperHelper {
  final RestClient? client;
  String? _imageUrl;

  WallpaperHelper({required this.client});

  String? get imageUrl => _imageUrl;

  Future<void> getRandomWallpaper() async {
    _imageUrl = null;

    try {
      var endpoint = 'https://api.unsplash.com/photos/random';
      endpoint += '?client_id=oim-16Ie_nspeGwp9jmuPjc27KtsR61z36hvRUA7mU4';

      final result = await client?.get(endpoint);

      _imageUrl = result?.data?['urls']['regular'] as String?;
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> setupWallpaper() async {
    if (_imageUrl == null) return;

    var file = await DefaultCacheManager().getSingleFile(_imageUrl!);

    try {
      await WallpaperManager.setWallpaperFromFile(
        file.path,
        WallpaperManager.HOME_SCREEN,
      );
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
