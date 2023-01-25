import 'package:e_commerce_app/modules/products/presentation/components/my_grid_view.dart';
import 'package:e_commerce_app/modules/products/presentation/components/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/product.dart';
import '../../cubit/products/products_cubit.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String _text = '';

  bool _containsSearchText(Product product) {
    final title = product.title;
    final textLower = _text.toLowerCase();
    final productLower = title.toLowerCase();

    return productLower.contains(textLower);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ProductsLoaded) {
          final allProducts = state.products;
          final products = allProducts.where(_containsSearchText).toList();

          return Column(
            children: [
              MySearchField(
                text: _text,
                onChanged: (text) => setState(() => _text = text),
                hintText: AppStrings.search,
              ),
              MyGridView(products: products),
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
