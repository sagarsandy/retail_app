import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';
import '../presentation/pages/food_categories_page.dart';

class FoodCategoriesPageRoute extends SSPageRoute {
  const FoodCategoriesPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.categories.name,
        path: SSAppRoutes.categories.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Categories",
              page: const FoodCategoriesPage(),
            ),
          );
        },
      );
}
