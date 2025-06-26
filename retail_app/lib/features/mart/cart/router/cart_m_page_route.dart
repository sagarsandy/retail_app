import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/features/mart/cart/presentation/pages/cart_m_page.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';

class CartMPageRoute extends SSPageRoute {
  const CartMPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.martCart.name,
        path: SSAppRoutes.martCart.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          // PrimaryCategory? primaryCategory;
          // final extraMap = state.extra as Map<String, Object?>;
          // if (extraMap.containsKey('primaryCategory')) {
          //   primaryCategory = extraMap['primaryCategory'] as PrimaryCategory;
          // }
          return buildPageWithAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Mart Cart Page",
              page: const CartMPage(),
            ),
          );
        },
      );
}
