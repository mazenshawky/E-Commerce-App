import 'package:flutter/material.dart';

import '../../modules/auth/presentation/common/freezed_data_classes.dart';
import '../error/failure.dart';
import 'app_colors.dart';
import 'app_strings.dart';
import 'app_values.dart';

class Constants {
  static bool isTextValid(String username) => username.length >= 3;

  static bool isPasswordValid(String password) => password.length >= 6;

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static bool isPhoneValid(String phone) =>
      RegExp(r'^01(0|1|2|5)\d{1,8}$').hasMatch(phone) && phone.length == 11;

  static bool areAllLoginInputsValid(LoginObject loginObject) =>
      isTextValid(loginObject.username) &&
      isPasswordValid(loginObject.password);

  static bool areAllSignUpInputsValid(SignupObject signupObject) =>
      isTextValid(signupObject.firstname) &&
      isTextValid(signupObject.lastname) &&
      isEmailValid(signupObject.email) &&
      isPhoneValid(signupObject.phone) &&
      isTextValid(signupObject.username) &&
      isPasswordValid(signupObject.password) &&
      isTextValid(signupObject.city) &&
      isTextValid(signupObject.street) &&
      isTextValid(signupObject.zipCode);

  static String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case UnauthorizedFailure:
        return AppStrings.unauthorizedFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      case InternetFailure:
        return AppStrings.internetFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }

  static void showPopupWidget(BuildContext context,
      {required List<Widget> children}) {
    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => dialog,
    );
  }

  static String adjustText(String name) =>
      "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
}
