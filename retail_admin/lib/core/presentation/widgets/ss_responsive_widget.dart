import 'package:flutter/material.dart';

class SSResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget web;

  const SSResponsiveWidget({
    super.key,
    required this.mobile,
    required this.web,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        } else {
          return web;
        }
      },
    );
  }
}
