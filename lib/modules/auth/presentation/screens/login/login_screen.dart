import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/modules/auth/presentation/components/login_auth_form.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_values.dart';
import '../../../../../core/widgets/my_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginUsernameController =
      TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s250,
              child: MyHeader(height: AppSize.s250),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p10),
                margin: const EdgeInsets.symmetric(
                    horizontal: AppMargins.m20, vertical: AppMargins.m10),
                child: Column(
                  children: [
                    const Text(
                      AppStrings.hello,
                      style: TextStyle(
                        fontSize: FontSize.s60,
                        fontWeight: FontWeights.fwBold,
                      ),
                    ),
                    const Text(
                      AppStrings.loginIntoYourAccount,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: AppSize.s30),
                    LoginAuthForm(
                      loginUsernameController: _loginUsernameController,
                      loginPasswordController: _loginPasswordController,
                      loginFormKey: _loginFormKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
