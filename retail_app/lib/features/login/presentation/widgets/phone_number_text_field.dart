import 'package:flutter/material.dart';

import '../../../../app/theme/ss_colors.dart';

class PhoneNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const PhoneNumberTextField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Enter mobile number',
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('🇮🇳', style: TextStyle(fontSize: 18.0)),
              Text(
                '+91',
                style: TextStyle(fontSize: 16.0, color: SSColors.black),
              ),
            ],
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: SSColors.primary1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: SSColors.primary1),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
