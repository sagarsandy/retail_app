import 'package:flutter/material.dart';

class CafeDetailsPageHelper {
  bool showAppBarTitle(ScrollNotification scrollNotification, bool showTitle) {
    if (scrollNotification.metrics.axis == Axis.vertical &&
        scrollNotification.metrics.pixels > 50 &&
        !showTitle) {
      return true;
    } else if (scrollNotification.metrics.axis == Axis.vertical &&
        scrollNotification.metrics.pixels <= 50 &&
        showTitle) {
      return false;
    }
    return showTitle;
  }
}
