import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class CouponsWidget extends StatefulWidget {
  final List<CafeCoupon> cafeCoupons;
  const CouponsWidget({super.key, required this.cafeCoupons});

  @override
  CouponsWidgetState createState() => CouponsWidgetState();
}

class CouponsWidgetState extends State<CouponsWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.90);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = (_currentPage + 1) % widget.cafeCoupons.length;
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
    if (widget.cafeCoupons.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.cafeCoupons.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final coupon = widget.cafeCoupons[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Card(
                  color: SSColors.white,
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
                          coupon.couponTitle,
                          style: Theme.of(context).textTheme.large(
                                SSColors.black,
                                fontWeight: FontWeightType.bold,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Use code : ",
                              style: Theme.of(context).textTheme.medium(
                                    SSColors.black,
                                  ),
                            ),
                            Text(
                              coupon.couponCode,
                              style: Theme.of(context).textTheme.medium(
                                    SSColors.black,
                                    fontWeight: FontWeightType.extraBold,
                                  ),
                            ),
                          ],
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
        if (widget.cafeCoupons.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.cafeCoupons.length, (index) {
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
