import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/widgets/state_animation_image.dart';
import 'package:e_commerce_app/core/widgets/state_choice_buttons.dart';
import 'package:e_commerce_app/core/widgets/state_error_button.dart';
import 'package:e_commerce_app/core/widgets/state_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_strings.dart';
import '../utils/constants.dart';

void statePopUpLoading(BuildContext context) => Constants.showPopupWidget(
      context,
      children: [
        const StateAnimationImage(animationImage: JsonAssets.loading),
        const StateText(text: AppStrings.loading),
        const SizedBox(height: AppSize.s20),
      ],
    );

void statePopUpSuccess(BuildContext context, {required String text}) =>
    Constants.showPopupWidget(
      context,
      children: [
        const StateAnimationImage(animationImage: JsonAssets.success),
        StateText(text: text),
        const StateButton(label: AppStrings.ok),
      ],
    );

void statePopUpError(BuildContext context, {required String text}) =>
    Constants.showPopupWidget(
      context,
      children: [
        const StateAnimationImage(animationImage: JsonAssets.error),
        StateText(text: text),
        const StateButton(label: AppStrings.tryAgain),
      ],
    );

void statePopUpChoice(BuildContext context,
        {required String text, required VoidCallback onPress}) =>
    Constants.showPopupWidget(
      context,
      children: [
        const StateAnimationImage(animationImage: JsonAssets.thinking),
        StateText(text: text),
        StateChoiceButtons(onPress: onPress),
      ],
    );
