import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_bar_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../../app/router/ss_app_routes.dart';

class OtpPage extends StatefulWidget {
  final String? phoneNumber;
  const OtpPage({super.key, this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SSAppBarWidget(showTitle: false, title: ""),
      backgroundColor: SSColors.transparent.surface(),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'OTP',
              style: Theme.of(context).textTheme.custom(
                    SSColors.black,
                    fontSize: 24,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter the OTP sent to ${widget.phoneNumber}',
              style: Theme.of(context).textTheme.medium(
                    SSColors.black,
                  ),
            ),
            const SizedBox(height: 20),
            Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: Theme.of(context).textTheme.custom(
                      SSColors.black,
                      fontSize: 20,
                      fontWeight: FontWeightType.bold,
                    ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: SSColors.primary1F),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: Theme.of(context).textTheme.custom(
                      SSColors.black,
                      fontSize: 20,
                      fontWeight: FontWeightType.bold,
                    ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: SSColors.primary1F),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: Theme.of(context).textTheme.custom(
                      SSColors.black,
                      fontSize: 20,
                      fontWeight: FontWeightType.bold,
                    ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: SSColors.primary1F),
                ),
              ),
              errorPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: Theme.of(context).textTheme.custom(
                      SSColors.black,
                      fontSize: 20,
                      fontWeight: FontWeightType.bold,
                    ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: SSColors.error2),
                ),
              ),
              validator: (value) {
                // Validate OTP input
                if (value == null || value.isEmpty) {
                  return 'Please enter OTP';
                }
                if (value.length != 4) {
                  return 'OTP must be 4 digits';
                }
                if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                  return 'OTP must be numeric';
                }
                if (value == "2222") {
                  context.goToPage(
                    SSAppRoutes.foodHome,
                  );
                }
                return 'Invalid OTP';
              },
              onCompleted: (pin) {
                // Handle OTP submission
                debugPrint('SS OTP entered: $pin');
              },
              onChanged: (value) {
                // Handle OTP input change
                debugPrint('SS OTP changed: $value');
              },
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.regular(
                      SSColors.black,
                    ),
                children: [
                  const TextSpan(text: "Didn't receive the OTP? "),
                  TextSpan(
                    text: 'Resend',
                    style: Theme.of(context).textTheme.regular(
                          SSColors.transparent.action(),
                          isUnderLine: true,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: Navigate to Terms of Service
                        Navigator.pushNamed(context, '/terms');
                      },
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
