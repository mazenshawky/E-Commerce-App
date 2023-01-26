import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:e_commerce_app/modules/auth/presentation/components/stream_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../cubit/cubit/signup_cubit.dart';
import 'already_have_an_account_check.dart';

class SignupAuthForm extends StatelessWidget {
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController zipCodeController;
  final GlobalKey<FormState> signupFormKey;

  const SignupAuthForm({
    Key? key,
    required this.firstnameController,
    required this.lastnameController,
    required this.emailController,
    required this.phoneController,
    required this.usernameController,
    required this.passwordController,
    required this.cityController,
    required this.streetController,
    required this.zipCodeController,
    required this.signupFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupFormKey,
      child: Column(
        children: [
          StreamTextField(
            controller: firstnameController,
            stream: BlocProvider.of<SignupCubit>(context).outIsFirstnameValid,
            hintText: AppStrings.firstname,
            leadingIcon: Icons.person,
            errorText: AppStrings.invalidFirstname,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: AppSize.s16),
          StreamTextField(
            controller: lastnameController,
            stream: BlocProvider.of<SignupCubit>(context).outIsLastnameValid,
            hintText: AppStrings.lastname,
            leadingIcon: Icons.person,
            errorText: AppStrings.invalidLastname,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: AppSize.s16),
          StreamTextField(
            controller: emailController,
            stream: BlocProvider.of<SignupCubit>(context).outIsEmailValid,
            hintText: AppStrings.email,
            leadingIcon: Icons.email,
            errorText: AppStrings.invalidEmail,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSize.s16),
          StreamTextField(
            controller: phoneController,
            stream: BlocProvider.of<SignupCubit>(context).outIsPhoneValid,
            hintText: AppStrings.phone,
            leadingIcon: Icons.phone,
            errorText: AppStrings.invalidPhone,
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: AppSize.s16),
          StreamTextField(
            controller: usernameController,
            stream: BlocProvider.of<SignupCubit>(context).outIsUsernameValid,
            hintText: AppStrings.username,
            leadingIcon: Icons.person,
            errorText: AppStrings.invalidUsername,
          ),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream: BlocProvider.of<SignupCubit>(context).outIsPasswordVisible,
            builder: (context, snapshot) {
              return StreamTextField(
                controller: passwordController,
                stream:
                    BlocProvider.of<SignupCubit>(context).outIsPasswordValid,
                hintText: AppStrings.password,
                leadingIcon: Icons.lock,
                errorText: AppStrings.invalidPassword,
                obsecureText: (snapshot.data ?? true) ? true : false,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p8),
                  child: GestureDetector(
                    onTap: () => BlocProvider.of<SignupCubit>(context)
                        .changePasswordVisibility((snapshot.data ?? true)),
                    child: (snapshot.data ?? true)
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                ),
              );
            },
          ),
          StreamTextField(
            controller: cityController,
            stream: BlocProvider.of<SignupCubit>(context).outIsCityValid,
            hintText: AppStrings.city,
            leadingIcon: Icons.location_city,
            errorText: AppStrings.invalidCity,
          ),
          const SizedBox(height: AppSize.s16),
          StreamTextField(
            controller: streetController,
            stream: BlocProvider.of<SignupCubit>(context).outIsStreetValid,
            hintText: AppStrings.street,
            leadingIcon: Icons.add_road,
            errorText: AppStrings.invalidStreet,
            inputType: TextInputType.streetAddress,
          ),
          const SizedBox(height: AppSize.s16),
          StreamTextField(
            controller: zipCodeController,
            stream: BlocProvider.of<SignupCubit>(context).outIsZipCodeValid,
            hintText: AppStrings.zipCode,
            leadingIcon: Icons.location_history,
            errorText: AppStrings.invalidzipCode,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream: BlocProvider.of<SignupCubit>(context).outAreAllInputsValid,
            builder: (context, snapshot) {
              return MyButton(
                onPress: (snapshot.data ?? false)
                    ? () => BlocProvider.of<SignupCubit>(context).signup()
                    : null,
                text: AppStrings.signup,
              );
            },
          ),
          SizedBox(height: context.height * AppSize.s0_0_3),
          AlreadyHaveAnAccountCheck(
            isLoginScreen: false,
            press: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
