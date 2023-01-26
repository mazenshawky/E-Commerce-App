import 'package:flutter/material.dart';

import '../utils/app_values.dart';

class StateButton extends StatelessWidget {
  final String label;

  const StateButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p90, vertical: AppPadding.p15),
      child: SizedBox(
        width: AppSize.s450,
        child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(), child: Text(label)),
      ),
    );
  }
}
