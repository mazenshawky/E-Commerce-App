import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class TempTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData leadingIcon;
  final String emptyText;
  final String invalidText;
  final bool isSuffix;

  const TempTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leadingIcon,
    required this.emptyText,
    required this.invalidText,
    this.isSuffix = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      obscureText: true,
      cursorColor: AppColors.primary,
      validator: (value) {
        if (value!.isEmpty) {
          return emptyText;
        } else if (value.length < 6) {
          return invalidText;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Icon(leadingIcon),
        ),
        suffixIcon: isSuffix
            ? const Padding(
                padding: EdgeInsets.only(right: AppPadding.p8),
                child: Icon(Icons.visibility_outlined),
              )
            : null,
      ),
    );
  }
}
