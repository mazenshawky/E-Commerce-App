import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

PreferredSizeWidget? myAppBar({required String title}) => AppBar(
      backgroundColor: AppColors.transparentColor,
      title: Text(title),
      leading: const BackButton(color: AppColors.primary),
    );
