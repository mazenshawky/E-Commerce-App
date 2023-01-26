import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:e_commerce_app/modules/auth/presentation/components/temp_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import 'already_have_an_account_check.dart';

class LoginAuthForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey;

  const LoginAuthForm({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.loginFormKey,
  }) : super(key: key);

  void _login(BuildContext context) {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      loginFormKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          TempTextField(
            controller: usernameController,
            hintText: AppStrings.username,
            leadingIcon: Icons.person,
            emptyText: AppStrings.emptyUsername,
            invalidText: AppStrings.invalidUsername,
          ),
          const SizedBox(height: AppSize.s16),
          TempTextField(
            controller: passwordController,
            hintText: AppStrings.password,
            leadingIcon: Icons.lock,
            emptyText: AppStrings.emptyPassword,
            invalidText: AppStrings.invalidPassword,
          ),
          const SizedBox(height: AppSize.s16),
          MyButton(onPress: () => _login(context), text: AppStrings.login),
          SizedBox(height: context.height * AppSize.s0_0_3),
          AlreadyHaveAnAccountCheck(
            press: () => Navigator.of(context).pushNamed(Routes.signupRoute),
          ),
        ],
      ),
    );
  }
}
