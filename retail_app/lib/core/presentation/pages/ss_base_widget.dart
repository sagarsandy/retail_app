import 'package:flutter/material.dart';

typedef WidgetBuilder = Widget Function(BuildContext);

class SSBaseWidget extends StatefulWidget {
  final WidgetBuilder page;
  final String title;
  SSBaseWidget({
    super.key,
    required this.title,
    required Widget page,
  }) : page = _builderOrNull(page)!;

  static WidgetBuilder? _builderOrNull(Widget? widget) {
    return widget == null ? null : ((_) => widget);
  }

  @override
  State<SSBaseWidget> createState() => _SSBaseWidgetState();
}

class _SSBaseWidgetState extends State<SSBaseWidget> {
  @override
  void initState() {
    debugPrint("SSBaseWidget: ${widget.title} initialized");
    super.initState();
  }

  @override
  void dispose() {
    debugPrint("SSBaseWidget: ${widget.title} disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.page(context);
  }
}
