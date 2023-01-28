import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../utils/app_values.dart';

class StateChoiceButtons extends StatelessWidget {
  final VoidCallback onPress;

  const StateChoiceButtons({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p40, vertical: AppPadding.p15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppSize.s100,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(AppStrings.no),
            ),
          ),
          SizedBox(
            width: AppSize.s100,
            child: ElevatedButton(
              onPressed: onPress,
              child: const Text(AppStrings.yes),
            ),
          ),
        ],
      ),
    );
  }
}
