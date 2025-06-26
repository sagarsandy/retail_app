import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_bar_widget.dart';
import 'package:retail_app/features/mart/home/domain/models/category_test_data.dart';
import 'package:retail_app/features/mart/home/domain/models/mart_category.dart';
import 'package:retail_app/features/mart/home/domain/models/primary_category.dart';
import 'package:retail_app/features/mart/product/presentation/widgets/categories_m_widget.dart';
import 'package:retail_app/features/mart/product/presentation/widgets/product_listing_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';

class ProductListingPage extends StatefulWidget {
  final PrimaryCategory? primaryCategory;
  const ProductListingPage({
    super.key,
    this.primaryCategory,
  });

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  late MartCategory martCategory;

  @override
  void initState() {
    super.initState();
    martCategory = CategoryTestData().martCategoriesTestData()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surfaceM,
      appBar: SSAppBarWidget(
        showTitle: true,
        title: widget.primaryCategory?.name ?? 'Products',
        showLeadingIcon: true,
        trailingWidget: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Implement search functionality here
          },
        ),
      ),
      body: const Row(
        children: [
          CategoriesMWidget(),
          Expanded(
            child: Column(
              children: [
                // FiltersMWidget(),
                SizedBox(height: 2), // Spacing between filters and products
                Expanded(
                  child: ProductListingWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
