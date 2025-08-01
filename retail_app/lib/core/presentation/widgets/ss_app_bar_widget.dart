import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_icon_button.dart';

class SSAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showTitle;
  final bool showLeadingIcon;
  final Function()? onLeadingIconTap;
  final String title;
  final Widget? trailingWidget;

  const SSAppBarWidget({
    super.key,
    required this.showTitle,
    this.onLeadingIconTap,
    required this.title,
    this.trailingWidget,
    this.showLeadingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent.surface(),
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
      leading: showLeadingIcon
          ? SSIconButton(
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
            )
          : const SizedBox.shrink(),
      actions: [
        trailingWidget ?? const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
