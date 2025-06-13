import 'package:flutter/material.dart';
import 'package:retail_app/core/util/app_util.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../enums/app_enum.dart';

class SSCircularLoadingWidget extends StatelessWidget {
  const SSCircularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppUtil().appType == AppType.mart
            ? SSColors.actionM
            : SSColors.actionF,
      ),
    );
  }
}
