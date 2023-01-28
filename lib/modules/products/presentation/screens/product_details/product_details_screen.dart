import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/add_and_edit_widget.dart';
import 'package:e_commerce_app/core/widgets/my_app_bar.dart';
import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:e_commerce_app/modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/state_popups.dart';
import '../../../../cart/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import '../../../domain/entities/product.dart';
import '../../cubit/delete_product/delete_product_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  _getProductDetails() async =>
      await BlocProvider.of<ProductDetailsCubit>(context)
          .getProductDetails(widget.productId);

  @override
  void initState() {
    super.initState();
    _getProductDetails();
  }

  Widget _buildImage(Product productDetails) {
    return Image.network(
      productDetails.image,
      height: context.height * 0.4,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitleAndPriceWidget(Product productDetails) {
    return Row(
      children: [
        Expanded(
          child: Text(
            productDetails.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          width: AppPadding.p16,
        ),
        Text(
          '\$${productDetails.price}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }

  Widget _buildDescription(Product productDetails) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Text(
        productDetails.description,
      ),
    );
  }

  void _addToCart({required int productId}) =>
      BlocProvider.of<AddToCartCubit>(context).addToCart(productId: productId);

  Widget _buildAddToCartPressedBloc() {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is AddToCartLoading) {
          statePopUpLoading(context);
        }
        if (state is AddToCartSuccess) {
          Navigator.pop(context);
          statePopUpSuccess(context, text: AppStrings.addedSuccessfully);
        }
        if (state is AddToCartError) {
          Navigator.pop(context);
          statePopUpError(context, text: state.message);
        }
      },
      child: Container(),
    );
  }

  void _deleteProduct({required int productId}) {
    Navigator.of(context).pop();
    BlocProvider.of<DeleteProductCubit>(context)
        .deleteProduct(productId: productId);
  }

  Widget _buildDeleteProductPressedBloc() {
    return BlocListener<DeleteProductCubit, DeleteProductState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is DeleteProductLoading) {
          statePopUpLoading(context);
        }
        if (state is DeleteProductSuccess) {
          Navigator.pop(context);
          statePopUpSuccess(context, text: AppStrings.deletedSuccessfully);
        }
        if (state is DeleteProductError) {
          Navigator.pop(context);
          statePopUpError(context, text: state.message);
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: AppStrings.productDetails),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductDetailsError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ProductDetailsLoaded) {
            return Column(
              children: [
                _buildImage(state.productDetails),
                const SizedBox(height: AppPadding.p16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(AppPadding.p16,
                        AppPadding.p32, AppPadding.p16, AppPadding.p16),
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s36),
                        topRight: Radius.circular(AppSize.s36),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitleAndPriceWidget(state.productDetails),
                          _buildDescription(state.productDetails),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p100,
                            ),
                            child: AddAndEditWidget(
                              deletePressed: () => statePopUpChoice(
                                context,
                                text: AppStrings.areYouSureForProduct,
                                onPress: () =>
                                    _deleteProduct(productId: widget.productId),
                              ),
                              editPressed: () =>
                                  Navigator.of(context).pushNamed(
                                Routes.editProductRoute,
                                arguments: state.productDetails,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppPadding.p24),
                          MyButton(
                            onPress: () => _addToCart(
                              productId: widget.productId,
                            ),
                            text: AppStrings.addToCart,
                          ),
                          _buildAddToCartPressedBloc(),
                          _buildDeleteProductPressedBloc(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
