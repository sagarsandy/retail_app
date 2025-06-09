import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_admin/features/food/home/presentation/pages/admin_home_page.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';

class HomePageRoute extends SSPageRoute {
  const HomePageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.home.name,
        path: SSAppRoutes.home.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Home Page",
              page: const AdminHomePage(),
            ),
          );
        },
      );
}
