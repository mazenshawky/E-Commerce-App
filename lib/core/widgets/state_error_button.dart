import 'package:flutter/material.dart';

import '../utils/app_values.dart';

class StateButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPress;

  const StateButton({
    super.key,
    required this.label,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p90, vertical: AppPadding.p15),
      child: SizedBox(
        width: AppSize.s450,
        child: ElevatedButton(
          onPressed: onPress ?? () => Navigator.of(context).pop(),
          child: Text(label),
        ),
      ),
    );
  }
}
