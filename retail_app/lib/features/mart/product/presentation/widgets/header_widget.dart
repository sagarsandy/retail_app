import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SSAppBarWidget(
      showTitle: true,
      title: title,
      showLeadingIcon: true,
      trailingWidget: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          // Implement search functionality here
        },
      ),
    );
  }
}
