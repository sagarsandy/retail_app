import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_colors.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

class CouponsWidget extends StatefulWidget {
  const CouponsWidget({super.key});

  @override
  CouponsWidgetState createState() => CouponsWidgetState();
}

class CouponsWidgetState extends State<CouponsWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.90);
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, String>> coupons = [
    {"title": "10% OFF", "subtitle": "Use code SS10"},
    {"title": "20% OFF", "subtitle": "Use code SS20"},
    {"title": "15% OFF", "subtitle": "Use code SS15"},
    {"title": "30% OFF", "subtitle": "Use code SS30"},
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = (_currentPage + 1) % coupons.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: PageView.builder(
            controller: _pageController,
            itemCount: coupons.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final coupon = coupons[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          coupon["title"] ?? "",
                          style: Theme.of(context).textTheme.large(
                                SSColors.black,
                                fontWeight: FontWeightType.bold,
                              ),
                        ),
                        Text(
                          coupon["subtitle"] ?? "",
                          style: Theme.of(context).textTheme.medium(
                                SSColors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        if (coupons.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(coupons.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 10 : 6,
                height: _currentPage == index ? 10 : 6,
                decoration: BoxDecoration(
                  color: SSColors.grey1.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              );
            }),
          )
      ],
    );
  }
}
