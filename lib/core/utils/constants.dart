import 'package:e_commerce_app/modules/products/presentation/common/product_freezed_data_classes.dart';
import 'package:flutter/material.dart';

import '../../modules/auth/presentation/common/auth_freezed_data_classes.dart';
import '../error/failure.dart';
import '../widgets/state_animation_image.dart';
import '../widgets/state_choice_buttons.dart';
import '../widgets/state_error_button.dart';
import '../widgets/state_text.dart';
import 'app_assets.dart';
import 'app_colors.dart';
import 'app_strings.dart';
import 'app_values.dart';

class Constants {
  static bool isTextValid(String text) => text.length >= 3;

  static bool isPasswordValid(String password) => password.length >= 6;

  static bool isDescriptionValid(String desciption) => desciption.length >= 10;

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static bool isPhoneValid(String phone) =>
      RegExp(r'^01(0|1|2|5)\d{1,8}$').hasMatch(phone) && phone.length == 11;

  static bool isPriceValid(double price) => price >= 10.0;

  static bool isImageValid(String image) => image.isNotEmpty;

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

  static bool areAllProductInputsValid(ProductObject productObject) =>
      isTextValid(productObject.title) &&
      isPriceValid(productObject.price) &&
      isTextValid(productObject.description) &&
      isImageValid(productObject.image) &&
      isTextValid(productObject.category);

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

  static void statePopUpLoading(BuildContext context) => showPopupWidget(
        context,
        children: [
          const StateAnimationImage(animationImage: JsonAssets.loading),
          const StateText(text: AppStrings.loading),
          const SizedBox(height: AppSize.s20),
        ],
      );

  static void statePopUpSuccess(BuildContext context, {required String text}) =>
      showPopupWidget(
        context,
        children: [
          const StateAnimationImage(animationImage: JsonAssets.success),
          StateText(text: text),
          const StateButton(label: AppStrings.ok),
        ],
      );

  static void statePopUpError(BuildContext context, {required String text}) =>
      showPopupWidget(
        context,
        children: [
          const StateAnimationImage(animationImage: JsonAssets.error),
          StateText(text: text),
          const StateButton(label: AppStrings.tryAgain),
        ],
      );

  static void statePopUpChoice(BuildContext context,
          {required String text, required VoidCallback onPress}) =>
      showPopupWidget(
        context,
        children: [
          const StateAnimationImage(animationImage: JsonAssets.thinking),
          StateText(text: text),
          StateChoiceButtons(onPress: onPress),
        ],
      );

  static void showPicker(
    BuildContext context, {
    required VoidCallback galleryPressed,
    required VoidCallback cameraPressed,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera),
                title: const Text(
                  AppStrings.photoCamera,
                  style: TextStyle(color: AppColors.primary),
                ),
                onTap: cameraPressed,
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(
                  AppStrings.photoGallery,
                  style: TextStyle(color: AppColors.primary),
                ),
                onTap: galleryPressed,
              ),
            ],
          ),
        );
      },
    );
  }

  static String adjustText(String name) =>
      "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
}
