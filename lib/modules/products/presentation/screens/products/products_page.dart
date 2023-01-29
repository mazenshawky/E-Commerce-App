import 'package:e_commerce_app/modules/products/presentation/components/my_grid_view.dart';
import 'package:e_commerce_app/modules/products/presentation/components/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/dummy.dart';
import '../../../domain/entities/product.dart';
import '../../components/category_card.dart';
import '../../cubit/categories/categories_cubit.dart';
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

  Widget _buildCategoriesBloc() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Expanded(
            flex: 1,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CategoriesError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CategoriesLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Row(
                children: List.generate(
                  state.categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p16),
                    child: CategoryCard(
                      title: state.categories[index],
                      icon: categoriesIcons[index],
                      press: () => BlocProvider.of<ProductsCubit>(context)
                          .getFilteredProducts(
                        category: state.categories[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Expanded(
            flex: 1,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildProductsBLoc() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Expanded(
            flex: 7,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductsError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ProductsLoaded) {
          final allProducts = state.products;
          final products = allProducts.where(_containsSearchText).toList();
          return MyGridView(products: products);
        } else if (state is FilteredProductsLoaded) {
          final filteredProducts = state.filteredProducts;
          final products = filteredProducts.where(_containsSearchText).toList();
          return MyGridView(products: products);
        } else if (state is SortedProductsLoaded) {
          final sortedProducts = state.sortedProducts;
          final products = sortedProducts.where(_containsSearchText).toList();
          return MyGridView(products: products);
        } else if (state is LimitedProductsLoaded) {
          final limitedProducts = state.limitedProducts;
          final products = limitedProducts.where(_containsSearchText).toList();
          return MyGridView(products: products);
        } else {
          return const Expanded(
            flex: 7,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySearchField(
          text: _text,
          onChanged: (text) => setState(() => _text = text),
          hintText: AppStrings.search,
        ),
        _buildCategoriesBloc(),
        _buildProductsBLoc(),
      ],
    );
  }
}
