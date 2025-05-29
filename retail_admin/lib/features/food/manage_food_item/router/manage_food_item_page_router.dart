import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';
import '../presentation/pages/manage_food_item_page.dart';

class ManageFoodItemPageRouter extends SSPageRoute {
  const ManageFoodItemPageRouter(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.manageFoodItem.name,
        path: SSAppRoutes.manageFoodItem.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          FoodItem? foodItem;
          final extraMap = state.extra as Map<String, Object?>;
          if (extraMap.containsKey('foodItem')) {
            foodItem = extraMap['foodItem'] as FoodItem;
          }
          return buildPageWithAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: foodItem != null ? "Edit Food Item" : "Add Food Item",
              page: ManageFoodItemPage(foodItem: foodItem),
            ),
          );
        },
      );
}
