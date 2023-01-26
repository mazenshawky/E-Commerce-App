import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class StreamTextField extends StatelessWidget {
  final TextEditingController controller;
  final Stream<bool> stream;
  final String hintText;
  final IconData leadingIcon;
  final String errorText;
  final TextInputType? inputType;
  final bool? obsecureText;
  final Widget? suffixIcon;

  const StreamTextField({
    super.key,
    required this.controller,
    required this.stream,
    required this.hintText,
    required this.leadingIcon,
    required this.errorText,
    this.inputType = TextInputType.text,
    this.obsecureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: stream,
      builder: (context, snapshot) {
        return TextFormField(
          controller: controller,
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          cursorColor: AppColors.primary,
          obscureText: obsecureText!,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Icon(leadingIcon),
            ),
            errorText: (snapshot.data ?? true) ? null : errorText,
            suffixIcon: suffixIcon,
          ),
        );
      },
    );
  }
}
