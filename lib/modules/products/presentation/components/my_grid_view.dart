import 'package:e_commerce_app/modules/products/presentation/components/product_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/product.dart';

class MyGridView extends StatelessWidget {
  final List<Product> products;

  const MyGridView({super.key, required this.products});

  void _goToProductDetails(BuildContext context, int producId) =>
      Navigator.of(context)
          .pushNamed(Routes.productDetailsRoute, arguments: producId);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSize.s2,
          childAspectRatio: AppSize.s0_8,
          crossAxisSpacing: AppSize.s30,
          mainAxisSpacing: AppSize.s30,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onPress: () => _goToProductDetails(context, products[index].id!),
          );
        },
      ),
    );
  }
}
