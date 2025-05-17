import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_admin/features/food/add_cafe/presentation/pages/add_cafe_page.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../core/presentation/pages/ss_base_widget.dart';

class LoginPageRoute extends SSPageRoute {
  const LoginPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.login.name,
        path: SSAppRoutes.login.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Add Cafe Page",
              page: const AddCafePage(),
            ),
          );
        },
      );
}
