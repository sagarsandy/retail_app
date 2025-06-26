import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';

class ProductImagesScrollWidget extends StatefulWidget {
  final List<String> offers;
  const ProductImagesScrollWidget({super.key, required this.offers});

  @override
  ProductImagesScrollWidgetState createState() =>
      ProductImagesScrollWidgetState();
}

class ProductImagesScrollWidgetState extends State<ProductImagesScrollWidget> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;
  late Timer _timer;
  final List<Color> _offerColors = [
    SSColors.primary1M,
    SSColors.primary2M,
    SSColors.actionM,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = (_currentPage + 1) % widget.offers.length;
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
    if (widget.offers.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35 + 20,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.offers.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  color: _offerColors[index],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          if (widget.offers.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.offers.length, (index) {
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
      ),
    );
  }
}
