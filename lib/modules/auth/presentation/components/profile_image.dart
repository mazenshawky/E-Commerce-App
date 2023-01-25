import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s100),
        border: Border.all(width: AppSize.s5, color: AppColors.whiteColor),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackColor12,
            blurRadius: AppSize.s20,
            offset: Offset(AppSize.s5, AppSize.s5),
          ),
        ],
      ),
      child: const Icon(
        Icons.person,
        size: AppSize.s80,
        color: AppColors.primary,
      ),
    );
  }
}
