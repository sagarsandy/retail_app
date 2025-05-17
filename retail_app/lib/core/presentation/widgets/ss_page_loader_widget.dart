import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';

class SSPageLoaderWidget extends StatefulWidget {
  const SSPageLoaderWidget({super.key});

  @override
  State<SSPageLoaderWidget> createState() => _SSPageLoaderWidgetState();
}

class _SSPageLoaderWidgetState extends State<SSPageLoaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: SSColors.action.withOpacity(0.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26.withOpacity(0.03),
                    blurRadius: 3,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
            ),
            Positioned(
              child: Transform.rotate(
                angle: -0.75, // Rotate spoon
                child: const Text(
                  '🥄',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Positioned(
              child: Transform.rotate(
                angle: 0.75, // Rotate fork
                child: const Text(
                  '🍴',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
