import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../utils/app_values.dart';

class StateText extends StatelessWidget {
  final String text;

  const StateText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppPadding.p15,
        left: AppPadding.p8,
        right: AppPadding.p8,
        top: AppPadding.p8,
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: FontSize.s18, fontWeight: FontWeights.fw500),
      ),
    );
  }
}
