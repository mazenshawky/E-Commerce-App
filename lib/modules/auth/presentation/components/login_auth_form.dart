import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import 'already_have_an_account_check.dart';

class LoginAuthForm extends StatelessWidget {
  final TextEditingController loginUsernameController;
  final TextEditingController loginPasswordController;
  final GlobalKey<FormState> loginFormKey;

  const LoginAuthForm({
    Key? key,
    required this.loginUsernameController,
    required this.loginPasswordController,
    required this.loginFormKey,
  }) : super(key: key);

  Widget _usernameTextField() => TextFormField(
        controller: loginUsernameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.primary,
        validator: (value) {
          if (value!.isEmpty) {
            return AppStrings.emptyUsername;
          } else if (value.length < 3) {
            return AppStrings.invalidUsername;
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: AppStrings.username,
          prefixIcon: Padding(
            padding: EdgeInsets.all(AppPadding.p16),
            child: Icon(Icons.person),
          ),
        ),
      );

  Widget _passwordTextField() => TextFormField(
        controller: loginPasswordController,
        textInputAction: TextInputAction.done,
        obscureText: true,
        cursorColor: AppColors.primary,
        validator: (value) {
          if (value!.isEmpty) {
            return AppStrings.emptyPassword;
          } else if (value.length < 6) {
            return AppStrings.invalidPassword;
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: AppStrings.password,
          prefixIcon: Padding(
            padding: EdgeInsets.all(AppPadding.p16),
            child: Icon(Icons.lock),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: AppPadding.p8),
            child: Icon(Icons.visibility_outlined),
          ),
        ),
      );

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
          _usernameTextField(),
          const SizedBox(height: AppSize.s16),
          _passwordTextField(),
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
