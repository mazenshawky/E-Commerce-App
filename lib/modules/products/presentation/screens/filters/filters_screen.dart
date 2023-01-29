import 'package:e_commerce_app/modules/products/presentation/cubit/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../core/widgets/my_list_tile.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  Widget _buildFilterPressedBloc() {
    return BlocListener<ProductsCubit, ProductsState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is ProductsLoading) {
          Constants.statePopUpLoading(context);
        }
        if (state is ProductsLoaded ||
            state is FilteredProductsLoaded ||
            state is SortedProductsLoaded) {
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

  _removeFilters(BuildContext context) async {
    await BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  _sortAscending(BuildContext context) async {
    await BlocProvider.of<ProductsCubit>(context)
        .getSortedProducts(sortType: 'asc');
  }

  _sortDescending(BuildContext context) async {
    await BlocProvider.of<ProductsCubit>(context)
        .getSortedProducts(sortType: 'desc');
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
            _buildFilterPressedBloc(),
          ],
        ),
      ),
    );
  }
}
