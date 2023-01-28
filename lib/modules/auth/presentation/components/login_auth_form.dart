import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:e_commerce_app/core/widgets/my_stream_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../cubit/login/login_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          MyStreamTextField(
            controller: usernameController,
            stream: BlocProvider.of<LoginCubit>(context).outIsUsernameValid,
            hintText: AppStrings.username,
            leadingIcon: Icons.person,
            errorText: AppStrings.invalidUsername,
          ),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream: BlocProvider.of<LoginCubit>(context).outIsPasswordVisible,
            builder: (context, snapshot) {
              return MyStreamTextField(
                controller: passwordController,
                stream: BlocProvider.of<LoginCubit>(context).outIsPasswordValid,
                hintText: AppStrings.password,
                leadingIcon: Icons.lock,
                errorText: AppStrings.invalidPassword,
                obsecureText: (snapshot.data ?? true) ? true : false,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p8),
                  child: GestureDetector(
                    onTap: () => BlocProvider.of<LoginCubit>(context)
                        .changePasswordVisibility((snapshot.data ?? true)),
                    child: (snapshot.data ?? true)
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream: BlocProvider.of<LoginCubit>(context).outAreAllInputsValid,
            builder: (context, snapshot) {
              return MyButton(
                onPress: (snapshot.data ?? false)
                    ? () => BlocProvider.of<LoginCubit>(context).login()
                    : null,
                text: AppStrings.login,
              );
            },
          ),
          SizedBox(height: context.height * AppSize.s0_0_3),
          AlreadyHaveAnAccountCheck(
            press: () => Navigator.of(context).pushNamed(Routes.signupRoute),
          ),
        ],
      ),
    );
  }
}
