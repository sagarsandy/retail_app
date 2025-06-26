import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/features/mart/common/widgets/product_price_widget.dart';
import 'package:retail_app/features/mart/product_detail/presentation/widgets/product_images_scroll_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_cart_quantity_button_widget.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';
import '../../../../../core/presentation/widgets/ss_tag_text_widget.dart';

class ProductMDetailsPage extends StatelessWidget {
  const ProductMDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surfaceM,
      appBar: SSAppBarWidget(
        showTitle: true,
        title: 'Product details',
        showLeadingIcon: true,
        trailingWidget: IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            context.pushToPage(SSAppRoutes.martCart);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductImagesScrollWidget(
              offers: [
                'https://example.com/image1.jpg',
                'https://example.com/image2.jpg',
                'https://example.com/image3.jpg',
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Whole Farm Premium Organic Chicken, 1.5 kg can be packed",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.extraLarge(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      SSTagTextWidget(tagTitle: "1000g"),
                      SizedBox(width: 4),
                      SSTagTextWidget(tagTitle: "Quantity 4"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const ProductPriceWidget(
                    price: "99",
                    originalPrice: "199",
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed , Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed, Whole Farm Premium Organic Chicken, 1.5 kg can be packed",
                    maxLines: 15,
                    style: Theme.of(context).textTheme.regular(
                          SSColors.black,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
      floatingActionButton: const SizedBox(
        height: 30,
        width: 95,
        child: SSCartQuantityButtonWidget(title: "Add"),
      ),
    );
  }
}
