import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class SSImageProvider {
  static ImageProvider getImage(String? imageUrl) {
    return CachedNetworkImageProvider(imageUrl ?? "");
  }
}
