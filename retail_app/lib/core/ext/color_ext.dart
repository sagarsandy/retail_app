import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../enums/app_enum.dart';
import '../util/app_util.dart';

extension ColorExt on Color {
  Color surface() {
    return AppUtil().appType == AppType.food
        ? SSColors.surfaceF
        : SSColors.surfaceM;
  }

  Color primary1() {
    return AppUtil().appType == AppType.food
        ? SSColors.primary1F
        : SSColors.primary1M;
  }

  Color primary2() {
    return AppUtil().appType == AppType.food
        ? SSColors.primary2F
        : SSColors.primary2M;
  }

  Color action() {
    return AppUtil().appType == AppType.food
        ? SSColors.actionF
        : SSColors.actionM;
  }
}
