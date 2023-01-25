import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback onPress;
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: AppSize.s154,
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.backgorundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.s12),
                ),
              ),
              child: Image.network(
                product.image,
                height: AppSize.s132,
              ),
            ),
            const SizedBox(
              height: AppPadding.p8,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(color: AppColors.blackColor),
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  width: AppPadding.p4,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
