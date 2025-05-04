import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/ss_app_routes.dart';
import '../../../app/router/ss_page_route.dart';
import '../../../app/router/ss_route_utility.dart';
import '../presentation/pages/otp_page.dart';

class OTPPageRoute extends SSPageRoute {
  const OTPPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.otp.name,
        path: SSAppRoutes.otp.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          String? phoneNumber;
          final extraMap = state.extra as Map<String, Object?>;
          if (extraMap.containsKey('phoneNumber')) {
            phoneNumber = extraMap['phoneNumber'] as String;
          }
          return buildPageWithAnimation(
            context: context,
            state: state,
            child: OtpPage(
              phoneNumber: phoneNumber,
            ),
          );
        },
      );
}
