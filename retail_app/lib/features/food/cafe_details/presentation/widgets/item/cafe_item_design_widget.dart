import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_network_image_widget.dart';
import 'package:retail_app/core/presentation/widgets/ss_secondary_button_widget.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/cart/cubit/cafe_cart_cubit.dart';

import '../../../domain/models/cafe_details.dart';

class CafeItemDesignWidget extends StatefulWidget {
  final CafeItem cafeItem;
  const CafeItemDesignWidget({super.key, required this.cafeItem});

  @override
  State<CafeItemDesignWidget> createState() => _CafeItemDesignWidgetState();
}

class _CafeItemDesignWidgetState extends State<CafeItemDesignWidget> {
  final CafeCartCubit _cafeCartCubit = locator<CafeCartCubit>();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 180,
        width: 140,
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: SSNetworkImageWidget(
                imageUrl: widget.cafeItem.imageUrl ?? "",
              ),
            ),

            // Semi-transparent mask to dim the image
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.25),
              ),
            ),

            // "Add" Button at Bottom Center
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SSSecondaryButtonWidget(
                  title: "Add",
                  onTap: () {
                    _addItemToCafeCart();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addItemToCafeCart() {
    _cafeCartCubit.addToCart(widget.cafeItem);
  }
}
