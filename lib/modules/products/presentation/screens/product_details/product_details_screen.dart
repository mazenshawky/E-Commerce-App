import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/my_app_bar.dart';
import 'package:e_commerce_app/core/widgets/my_button.dart';
import 'package:e_commerce_app/modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/state_animation_image.dart';
import '../../../../../core/widgets/state_error_button.dart';
import '../../../../../core/widgets/state_text.dart';
import '../../../../cart/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import '../../../domain/entities/product.dart';

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

  Widget _buildAddToCartBloc() {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is AddToCartLoading) {
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.loading),
              const StateText(text: AppStrings.loading),
              const SizedBox(height: 20),
            ],
          );
        }
        if (state is AddToCartSuccess) {
          Navigator.pop(context);
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.success),
              const StateText(text: AppStrings.addedSuccessfully),
              const StateButton(label: AppStrings.ok),
            ],
          );
        }
        if (state is AddToCartError) {
          Navigator.pop(context);
          Constants.showPopupWidget(
            context,
            children: [
              const StateAnimationImage(animationImage: JsonAssets.error),
              StateText(text: state.message),
              const StateButton(label: AppStrings.tryAgain),
            ],
          );
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
                          const SizedBox(height: AppPadding.p24),
                          MyButton(
                              onPress: () => _addToCart(
                                    productId: widget.productId,
                                  ),
                              text: AppStrings.addToCart),
                          _buildAddToCartBloc(),
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
