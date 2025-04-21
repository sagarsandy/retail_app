import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_colors.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/core/ext/string_ext.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 6.0),
      child: Column(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                  "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(2, 5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Shawarma'.fitText(length: 11),
            style: Theme.of(context).textTheme.regular(SSColors.black),
          ),
        ],
      ),
    );
  }
}
