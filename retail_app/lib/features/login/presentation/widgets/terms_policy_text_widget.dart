import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class TermsPolicyTextWidget extends StatelessWidget {
  const TermsPolicyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.regular(
              SSColors.black,
            ),
        children: [
          const TextSpan(text: 'By continuing, you agree to our '),
          TextSpan(
            text: 'Terms of Service',
            style: Theme.of(context).textTheme.regular(
                  SSColors.transparent.action(),
                  isUnderLine: true,
                ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: Theme.of(context).textTheme.regular(
                  SSColors.transparent.action(),
                  isUnderLine: true,
                ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
