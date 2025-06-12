import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/enums/app_enum.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/widgets/ss_icon_button.dart';

import '../../../app/router/ss_app_routes.dart';

class SSAppSwitchWidget extends StatelessWidget {
  final AppType appType;
  const SSAppSwitchWidget({
    super.key,
    required this.appType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: SSIconButton(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(0),
        icon: Icon(
          Icons.apps,
          color: appType == AppType.food ? SSColors.actionF : SSColors.actionM,
          size: 28.0,
        ),
        onPressed: () {
          context.goToPage(SSAppRoutes.landing);
          // context.pushToPage(SSAppRoutes.cafeDetails);
        },
      ),
    );
  }
}
