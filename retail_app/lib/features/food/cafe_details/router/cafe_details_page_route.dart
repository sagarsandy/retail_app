import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';
import '../presentation/pages/cafe_details_page.dart';

class CafeDetailsPageRoute extends SSPageRoute {
  const CafeDetailsPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.foodDetails.name,
        path: SSAppRoutes.foodDetails.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Food Details Page",
              page: const CafeDetailsPage(),
            ),
          );
        },
      );
}
