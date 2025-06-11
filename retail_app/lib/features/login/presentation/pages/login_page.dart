import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/presentation/pages/ss_base_widget.dart';
import 'package:retail_app/features/login/presentation/widgets/phone_number_text_field.dart';
import 'package:retail_app/features/login/presentation/widgets/terms_policy_text_widget.dart';
import 'package:retail_app/features/login/service/post_login_service.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

import '../../../../app/router/ss_app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SSBaseWidget(title: "Login Page", page: const LoginPageBody());
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final PostLoginService postLoginService = PostLoginService();
  final TextEditingController phoneNumberController = TextEditingController();
  bool enableLoginButton = false;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surfaceF,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            GestureDetector(
              onTap: () {
                context.pushToPage(SSAppRoutes.foodHome);
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.custom(
                      SSColors.black,
                      fontSize: 30,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            PhoneNumberTextField(
              controller: phoneNumberController,
              onChanged: (String phoneNumber) {
                if (phoneNumber.length > 9) {
                  setState(() {
                    enableLoginButton = true;
                  });
                } else {
                  setState(() {
                    enableLoginButton = false;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: SSButtonWidget(
                title: "Login",
                isEnabled: enableLoginButton,
                elevation: 0,
                onTap: () {
                  context.pushToPage(SSAppRoutes.otp, extra: {
                    'phoneNumber': phoneNumberController.text,
                  });
                },
              ),
            ),
            const SizedBox(height: 2),
            const TermsPolicyTextWidget(),
          ],
        ),
      ),
    );
  }
}
