import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_button_widget.dart';
import 'package:retail_app/core/presentation/widgets/ss_network_image_widget.dart';

import '../../../domain/models/cafe_details.dart';

class CafeItemDesignWidget extends StatelessWidget {
  final CafeItem cafeItem;
  const CafeItemDesignWidget({super.key, required this.cafeItem});

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
                imageUrl: cafeItem.imageUrl ?? "",
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
                child: SSButtonWidget(
                  title: "Add",
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
