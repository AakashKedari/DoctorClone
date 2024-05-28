import 'package:flutter/material.dart';

class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    final ImageCache imageCache = super.createImageCache();
// Set your desired image cache size, for example, 100 MB
    imageCache.maximumSizeBytes = 1024 * 1024 * 100;
    return imageCache;
  }
}