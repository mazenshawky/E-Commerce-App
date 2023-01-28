import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/modules/auth/presentation/components/login_auth_form.dart';
import 'package:e_commerce_app/modules/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/my_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  void _bind() {
    _usernameController.addListener(() => BlocProvider.of<LoginCubit>(context)
        .setUsername(_usernameController.text));

    _passwordController.addListener(() => BlocProvider.of<LoginCubit>(context)
        .setPassword(_passwordController.text));
  }

  Widget _buildLoginButtonPressedBloc() {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is LoginLoading) {
          Constants.statePopUpLoading(context);
        }
        if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        }
        if (state is LoginError) {
          Navigator.pop(context);
          Constants.statePopUpError(context, text: state.message);
        }
      },
      child: Container(),
    );
  }

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
                      usernameController: _usernameController,
                      passwordController: _passwordController,
                      loginFormKey: _loginFormKey,
                    ),
                    _buildLoginButtonPressedBloc(),
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
