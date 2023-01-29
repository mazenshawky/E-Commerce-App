import 'package:e_commerce_app/modules/products/presentation/cubit/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../core/widgets/my_list_tile.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  Widget _buildLimitField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: DropdownButtonFormField<String>(
        onChanged: (value) => _limitProducts(context, limit: value),
        hint: const Text(AppStrings.limit),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.blackColor45,
        ),
        items: BlocProvider.of<ProductsCubit>(context)
            .productsIds
            .map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildFilterPressedBloc() {
    return BlocListener<ProductsCubit, ProductsState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is ProductsLoading) {
          Constants.statePopUpLoading(context);
        }
        if (state is ProductsLoaded ||
            state is FilteredProductsLoaded ||
            state is SortedProductsLoaded ||
            state is LimitedProductsLoaded) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
        if (state is ProductsError) {
          Navigator.pop(context);
          Constants.statePopUpError(context, text: state.message);
        }
      },
      child: Container(),
    );
  }

  void _removeFilters(BuildContext context) async {
    await BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  void _sortAscending(BuildContext context) async {
    await BlocProvider.of<ProductsCubit>(context)
        .getSortedProducts(sortType: 'asc');
  }

  void _sortDescending(BuildContext context) async {
    await BlocProvider.of<ProductsCubit>(context)
        .getSortedProducts(sortType: 'desc');
  }

  void _limitProducts(BuildContext context, {required String? limit}) async {
    await BlocProvider.of<ProductsCubit>(context)
        .getLimitedProducts(limit: limit!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: AppStrings.filters),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(AppPadding.p8),
          children: [
            MyListTile(
              leadingIcon: Icons.cancel_outlined,
              title: AppStrings.removeAllFilters,
              onTap: () => _removeFilters(context),
            ),
            MyListTile(
              leadingIcon: Icons.sort_sharp,
              title: AppStrings.sortAscending,
              onTap: () => _sortAscending(context),
            ),
            MyListTile(
              leadingIcon: Icons.sort_outlined,
              title: AppStrings.sortDescending,
              onTap: () => _sortDescending(context),
            ),
            const SizedBox(height: AppSize.s10),
            _buildLimitField(context),
            _buildFilterPressedBloc(),
          ],
        ),
      ),
    );
  }
}
