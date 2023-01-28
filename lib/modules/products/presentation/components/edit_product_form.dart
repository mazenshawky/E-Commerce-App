import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_image_field.dart';
import '../../../../core/widgets/my_stream_text_field.dart';
import '../cubit/categories/categories_cubit.dart';
import '../cubit/edit_product/edit_product_cubit.dart';

class EditProductForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> editProductFormKey;
  final dynamic productId;

  const EditProductForm({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.editProductFormKey,
    required this.productId,
  });

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  String? _category;

  Widget _buildCategoriesBloc() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: ((previous, current) => previous != current),
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const SizedBox(
            height: AppSize.s40,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CategoriesLoaded) {
          return DropdownButtonFormField<String>(
            onChanged: _categoryChanged,
            value: _category,
            hint: const Text(AppStrings.category),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.blackColor45,
            ),
            items: state.categories.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          );
        } else if (state is CategoriesError) {
          return SizedBox(
            height: AppSize.s40,
            child: Center(child: Text(state.message)),
          );
        } else {
          return const SizedBox(
            height: AppSize.s40,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  void _categoryChanged(String? category) {
    setState(() {
      BlocProvider.of<EditProductCubit>(context).setCategory(category!);
      _category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.editProductFormKey,
      child: Column(
        children: [
          MyStreamTextField(
            controller: widget.titleController,
            stream: BlocProvider.of<EditProductCubit>(context).outIsTitleValid,
            hintText: AppStrings.title,
            leadingIcon: Icons.label,
            errorText: AppStrings.invalidTitle,
          ),
          const SizedBox(height: AppSize.s16),
          MyStreamTextField(
            controller: widget.priceController,
            stream: BlocProvider.of<EditProductCubit>(context).outIsPriceValid,
            hintText: AppStrings.price,
            leadingIcon: Icons.price_change,
            errorText: AppStrings.invalidPrice,
            inputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'(^(0|1|2|3|4|5|6|7|8|9)\d*\.?\d*)')),
            ],
          ),
          const SizedBox(height: AppSize.s16),
          MyStreamTextField(
            controller: widget.descriptionController,
            stream: BlocProvider.of<EditProductCubit>(context)
                .outIsDescriptionValid,
            hintText: AppStrings.description,
            leadingIcon: Icons.text_snippet,
            errorText: AppStrings.invalidDesciption,
          ),
          const SizedBox(height: AppSize.s16),
          MyImageField(),
          const SizedBox(height: AppSize.s16),
          _buildCategoriesBloc(),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream:
                BlocProvider.of<EditProductCubit>(context).outAreAllInputsValid,
            builder: (context, snapshot) {
              return MyButton(
                onPress: (snapshot.data ?? false)
                    ? () => BlocProvider.of<EditProductCubit>(context)
                        .editProduct(productId: widget.productId)
                    : null,
                text: AppStrings.editProduct,
              );
            },
          ),
        ],
      ),
    );
  }
}
