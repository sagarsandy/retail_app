import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_icon_button.dart';

import '../../../app/theme/ss_colors.dart';

class SSAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showTitle;
  final Function()? onLeadingIconTap;
  final String title;
  final Widget? trailingWidget;

  const SSAppBarWidget({
    super.key,
    required this.showTitle,
    this.onLeadingIconTap,
    required this.title,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SSColors.surface,
      title: showTitle
          ? Text(
              title,
              style: Theme.of(context).textTheme.large(
                    SSColors.black,
                    fontWeight: FontWeightType.bold,
                  ),
            )
          : null,
      centerTitle: true,
      leading: SSIconButton(
        padding: const EdgeInsets.only(left: 4.0),
        icon: const Icon(
          Icons.arrow_back,
          color: SSColors.black,
          size: 24.0,
        ),
        onPressed: () {
          if (onLeadingIconTap != null) {
            onLeadingIconTap!();
          }
          context.popToPage();
        },
      ),
      actions: [
        trailingWidget ?? const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
