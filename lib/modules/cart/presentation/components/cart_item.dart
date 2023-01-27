import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/my_icon.dart';
import 'package:e_commerce_app/modules/cart/domain/entities/cart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';
import '../../../products/domain/entities/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final CartProduct cartProduct;

  const CartItem({
    super.key,
    required this.product,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: AppPadding.p12,
              bottom: AppPadding.p15,
              right: AppPadding.p25,
              left: AppPadding.p25),
          child: Row(
            children: [
              Container(
                width: AppSize.s55,
                height: AppSize.s55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                  ),
                ),
              ),
              const SizedBox(width: AppSize.s22),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            maxLines: 2,
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.close_outlined,
                              color: AppColors.grey,
                            ))
                      ],
                    ),
                    const SizedBox(height: AppSize.s13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const MyIcon(icon: Icons.remove),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s17),
                              child: Center(
                                  child: Text(
                                '${cartProduct.quantity}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              )),
                            ),
                            const MyIcon(icon: Icons.add),
                          ],
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
