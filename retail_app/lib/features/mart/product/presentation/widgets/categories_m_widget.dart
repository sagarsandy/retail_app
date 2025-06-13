import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class CategoriesMWidget extends StatelessWidget {
  const CategoriesMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: MediaQuery.of(context).size.height,
      color: SSColors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 75,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: SSColors.primary1M.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  const SizedBox(height: 4), // Spacer
                  Text(
                    "martCa",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.regular(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
