import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/ss_colors.dart';

class SSNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  const SSNetworkImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => Container(
        color: SSColors.secondary2.withOpacity(0.9),
      ),
    );
  }
}
