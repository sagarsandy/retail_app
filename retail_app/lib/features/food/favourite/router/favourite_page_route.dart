import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';
import '../presentation/pages/favourite_page.dart';

class FavouritePageRoute extends SSPageRoute {
  const FavouritePageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.foodFavourite.name,
        path: SSAppRoutes.foodFavourite.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Food Favourite Page",
              page: const FavouritePage(),
            ),
          );
        },
      );
}
