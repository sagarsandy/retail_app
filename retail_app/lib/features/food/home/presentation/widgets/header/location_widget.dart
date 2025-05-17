import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/ext/string_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.popToPage();
      },
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: SSColors.action,
              size: 40,
            ),
            const SizedBox(width: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Vijayawada",
                      style: Theme.of(context).textTheme.medium(
                            SSColors.black,
                            fontWeight: FontWeightType.bold,
                          ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: SSColors.action,
                      weight: 30,
                      size: 16,
                    ),
                  ],
                ),
                Text(
                  "Darsi peta, Patamata Darsi peta, Patamata Darsi peta, Patamata"
                      .fitText(length: 30),
                  style: Theme.of(context).textTheme.regular(
                        SSColors.black,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
