import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;

  const MyIcon({super.key, required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s45,
      width: AppSize.s45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightWhite),
        borderRadius: BorderRadius.circular(AppSize.s17),
      ),
      child: InkWell(
        onTap: onPress,
        child: Center(
          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
