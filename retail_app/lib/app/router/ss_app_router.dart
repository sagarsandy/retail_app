import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_route_initializer.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey(debugLabel: 'ss_root_navigator');
final GlobalKey<NavigatorState> appBarNavigatorKey =
    GlobalKey(debugLabel: 'ss_appbar_navigator');
final GlobalKey<NavigatorState> navBarNavigatorKey =
    GlobalKey(debugLabel: 'ss_navbar_navigator');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey(debugLabel: 'ss_shell_navigator');

class SSAppRouter {
  GoRouter get router => _makeRouter();

  GoRouter _makeRouter() {
    return GoRouter(
      initialLocation: SSAppRoutes.landing.navigationPath,
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      redirect: _handleAuthRedirect,
      routes: [
        ...SSRouteInitializer().allRoutes(),
      ],
      errorBuilder: (context, state) {
        // TODO : create unique error page
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }

  String? _handleAuthRedirect(BuildContext context, GoRouterState state) {
    const bool isLoggedIn = 2 / 2 == 1;

    if (!isLoggedIn) {
      return SSAppRoutes.login.navigationPath;
    }
    return null;
  }
}
