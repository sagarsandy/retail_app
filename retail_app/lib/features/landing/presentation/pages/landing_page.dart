import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/enums/app_enum.dart';
import 'package:retail_app/core/util/app_util.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../../app/router/ss_app_routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _animate = false;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.white.withOpacity(0.95),
      body: Stack(
        children: [
          Positioned(
            top: 130,
            left: 30,
            child: Text(
              'Welcome to Retail App',
              style: Theme.of(context).textTheme.custom(
                    fontSize: 26,
                    Colors.black,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
          ),
          Positioned(
            top: 180,
            left: 30,
            child: Text(
              'Choose from our services',
              style: Theme.of(context).textTheme.custom(
                    fontSize: 20,
                    Colors.black,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            left: _animate ? 50 : -100,
            top: MediaQuery.of(context).size.height / 2 - 150,
            child: GestureDetector(
              onTap: () {
                AppUtil().appType = AppType.food;
                context.goToPage(SSAppRoutes.foodHome);
              },
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/core/deliver_food.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            right: _animate ? 50 : -100,
            top: MediaQuery.of(context).size.height / 2 + 50,
            child: GestureDetector(
              onTap: () {
                AppUtil().appType = AppType.mart;
                context.goToPage(SSAppRoutes.martHome);
              },
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/core/deliver_grocery.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
