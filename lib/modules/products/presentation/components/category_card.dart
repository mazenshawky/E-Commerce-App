import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        foregroundColor: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p4,
          vertical: AppPadding.p8,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: AppSize.s40,
              width: AppSize.s40,
            ),
            const SizedBox(height: AppPadding.p8),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
