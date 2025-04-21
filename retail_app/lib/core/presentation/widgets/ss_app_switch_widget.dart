import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';

import '../../../app/router/ss_app_routes.dart';
import '../../../app/theme/ss_colors.dart';
import 'ss_icon_button.dart';

class SSAppSwitchWidget extends StatelessWidget {
  const SSAppSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: SSIconButton(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(0),
        icon: const Icon(
          Icons.apps,
          color: SSColors.action,
          size: 28.0,
        ),
        onPressed: () {
          context.pushToPage(SSAppRoutes.cafeDetails);
        },
      ),
    );
  }
}
