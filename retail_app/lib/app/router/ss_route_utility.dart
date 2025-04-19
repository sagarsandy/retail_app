import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_redirection_page.dart';

CustomTransitionPage buildPageWithAnimation({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  bool fromLeftToRight = false;

  if (state.extra is bool) {
    fromLeftToRight = state.extra as bool;
  }
  if (state.extra is Map<String, dynamic> && state.extra != null) {
    var details = state.extra as Map<String, dynamic>;
    fromLeftToRight =
        (details.containsKey("left") ? details["left"] as bool : false);
  }

  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    name: state.name,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin =
          !fromLeftToRight ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Cubic(0.8, 0, 0.4, 1);

      var offsetTween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(offsetTween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  );
}

CustomTransitionPage buildPageWithOutAnimation({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    name: state.name,
    child: child,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        child,
  );
}

CustomTransitionPage buildRedirectingPage({
  required BuildContext context,
  required GoRouterState state,
  required SSRouteInfo redirect,
}) {
  return buildPageWithOutAnimation(
    context: context,
    state: state,
    opaque: false,
    child: SSRedirectionPage(
      state: state,
      redirect: redirect,
    ),
  );
}
