import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';

class SSTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool isRequired;
  final String title;
  final double? height;
  const SSTextFieldWidget({
    super.key,
    this.controller,
    this.hint,
    this.maxLines = 1,
    this.keyboardType,
    this.isRequired = false,
    this.height = 50,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: SSColors.primary1, width: 2.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: SSColors.error1),
          ),
        ),
        validator: (value) {
          if ((value ?? '').isEmpty && isRequired) {
            return 'Please enter $title';
          }
          return null;
        },
      ),
    );
  }
}
