import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String? subtitle;

  const ProfileListItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      leading: Icon(leadingIcon, color: AppColors.primary),
      title: Text(title),
      subtitle: Text(subtitle ?? ''),
    );
  }
}
