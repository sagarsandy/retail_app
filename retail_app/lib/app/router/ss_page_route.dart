import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class SSPageRoute {
  final GlobalKey<NavigatorState> parentNavigatorKey;
  final List<RouteBase> subRoutes;

  const SSPageRoute(
    this.parentNavigatorKey, {
    this.subRoutes = const [],
  });

  RouteBase getRoute();

  String getPath() {
    return getPage().path;
  }

  String getName() {
    return getPage().name;
  }

  SSPage getPage() {
    return const SSPage('', '');
  }
}

class SSPage {
  final String name;
  final String path;

  const SSPage(
    this.name,
    this.path,
  );

  factory SSPage.shell() => const SSPage('', '');
}
