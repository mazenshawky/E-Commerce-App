import 'package:e_commerce_app/modules/cart/presentation/components/my_divider.dart';
import 'package:e_commerce_app/modules/products/presentation/cubit/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../products/domain/entities/product.dart';
import '../../components/cart_item.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../cubit/cart/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  Widget _buildTotalPrice(BuildContext context, List<Product> products) {
    final total =
        BlocProvider.of<CartCubit>(context).calculateCartTotalPrice(products);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.totalPrice),
        Text(
          '\$$total',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CartLoaded) {
          final allProducts =
              BlocProvider.of<ProductsCubit>(context).allProducts;
          final filteredProducts = BlocProvider.of<CartCubit>(context)
              .filterProductsAsUserCart(allProducts, state.cart);

          return Column(
            children: [
              _buildTotalPrice(context, filteredProducts),
              const SizedBox(height: AppSize.s10),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => CartItem(
                          product: filteredProducts[index],
                          cartProduct: state.cart.cartProducts[index],
                        ),
                    separatorBuilder: (context, index) => const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppPadding.p25),
                          child: MyDivider(),
                        ),
                    itemCount: filteredProducts.length),
              ),
              const MyButton(text: AppStrings.checkout),
              const SizedBox(height: AppSize.s13),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
