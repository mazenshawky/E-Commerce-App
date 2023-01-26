import 'package:e_commerce_app/config/routes/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/my_header.dart';
import '../../../../../core/widgets/state_animation_image.dart';
import '../../../../../core/widgets/state_error_button.dart';
import '../../../../../core/widgets/state_text.dart';
import '../../components/signup_auth_form.dart';
import '../../cubit/signup/signup_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  void _bind() {
    _firstnameController.addListener(() => BlocProvider.of<SignupCubit>(context)
        .setFirstname(_firstnameController.text));

    _lastnameController.addListener(() => BlocProvider.of<SignupCubit>(context)
        .setLastname(_lastnameController.text));

    _emailController.addListener(() =>
        BlocProvider.of<SignupCubit>(context).setEmail(_emailController.text));

    _phoneController.addListener(() =>
        BlocProvider.of<SignupCubit>(context).setPhone(_phoneController.text));

    _usernameController.addListener(() => BlocProvider.of<SignupCubit>(context)
        .setUsername(_usernameController.text));

    _passwordController.addListener(() => BlocProvider.of<SignupCubit>(context)
        .setPassword(_passwordController.text));

    _cityController.addListener(() =>
        BlocProvider.of<SignupCubit>(context).setCity(_cityController.text));

    _streetController.addListener(() => BlocProvider.of<SignupCubit>(context)
        .setStreet(_streetController.text));

    _zipCodeController.addListener(() => BlocProvider.of<SignupCubit>(context)
        .setZipCode(_zipCodeController.text));
  }

  Widget _buildSignupButtonPressedBloc() {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is SignupLoading) {
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.loading),
              const StateText(text: AppStrings.loading),
              const SizedBox(height: 20),
            ],
          );
        }
        if (state is SignupSuccess) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        }
        if (state is SignupError) {
          Navigator.pop(context);
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.error),
              StateText(text: state.message),
              const StateButton(label: AppStrings.tryAgain),
            ],
          );
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
              height: AppSize.s150,
              child: MyHeader(height: AppSize.s150),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p10),
                margin: const EdgeInsets.symmetric(
                    horizontal: AppMargins.m20, vertical: AppMargins.m10),
                child: SignupAuthForm(
                  firstnameController: _firstnameController,
                  lastnameController: _lastnameController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  cityController: _cityController,
                  streetController: _streetController,
                  zipCodeController: _zipCodeController,
                  signupFormKey: _signupFormKey,
                ),
              ),
            ),
            _buildSignupButtonPressedBloc(),
          ],
        ),
      ),
    );
  }
}
