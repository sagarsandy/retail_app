import 'package:flutter/material.dart';

enum ToastType { info, success, warning, error }

class SSToast {
  static void showToast({
    required String message,
    required BuildContext context,
    ToastType type = ToastType.info,
  }) {
    showCustomToast(context, message, type);
  }
}

void showCustomToast(BuildContext context, String message, ToastType type) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry; // late so we can use it inside onClose

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Material(
        elevation: 10,
        color: Colors.transparent,
        child: CustomToast(
          message: message,
          type: type,
          onClose: () => overlayEntry.remove(),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Auto remove after 3 seconds
  Future.delayed(const Duration(seconds: 5), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}

class CustomToast extends StatelessWidget {
  final String message;
  final ToastType type;
  final VoidCallback onClose;

  const CustomToast({
    super.key,
    required this.message,
    required this.type,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color backgroundColor;

    switch (type) {
      case ToastType.success:
        icon = Icons.check_circle;
        backgroundColor = Colors.green;
        break;
      case ToastType.error:
        icon = Icons.error;
        backgroundColor = Colors.red;
        break;
      case ToastType.warning:
        icon = Icons.warning;
        backgroundColor = Colors.orange;
        break;
      case ToastType.info:
      default:
        icon = Icons.info;
        backgroundColor = Colors.blue;
        break;
    }

    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: backgroundColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 40,
            color: backgroundColor,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onClose,
            child: Icon(Icons.close, color: backgroundColor),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
