import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  _signup(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MyButton(
        text: AppStrings.signup,
        onPress: () => _signup(context),
      )),
    );
  }
}
