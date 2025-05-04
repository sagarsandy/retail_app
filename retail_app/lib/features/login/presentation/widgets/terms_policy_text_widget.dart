import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../app/theme/ss_colors.dart';

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
                  SSColors.action,
                  isUnderLine: true,
                ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: Theme.of(context).textTheme.regular(
                  SSColors.action,
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
