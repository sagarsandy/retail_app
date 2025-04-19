import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_button_widget.dart';

class ItemDesignWidget extends StatelessWidget {
  const ItemDesignWidget({super.key});

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
              child: Image.network(
                'https://w7.pngwing.com/pngs/520/887/png-transparent-biryani-thumbnail.png',
                fit: BoxFit.fill,
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
