import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_admin/app/router/ss_app_routes.dart';

class SSRedirectionPage extends StatefulWidget {
  const SSRedirectionPage({
    super.key,
    required this.state,
    required this.redirect,
  });

  final GoRouterState state;
  final SSRouteInfo redirect;

  @override
  State<SSRedirectionPage> createState() => _SSRedirectionPageState();
}

class _SSRedirectionPageState extends State<SSRedirectionPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.goNamed(
        widget.redirect.name,
        extra: widget.state.extra,
        queryParameters: widget.state.uri.queryParameters,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
