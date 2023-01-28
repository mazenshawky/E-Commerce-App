import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/my_button.dart';
import '../cubit/add_product/add_product_cubit.dart';
import 'add_product_image_field.dart';
import '../../../../core/widgets/my_stream_text_field.dart';

class AddProductForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> editProductFormKey;
  final List<String> categories;

  const AddProductForm({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.editProductFormKey,
    required this.categories,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  String? _category;

  Widget _buildCategoriesField() {
    return DropdownButtonFormField<String>(
      onChanged: _categoryChanged,
      value: _category,
      hint: const Text(AppStrings.category),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.blackColor45,
      ),
      items: widget.categories.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  void _categoryChanged(String? category) {
    setState(() {
      BlocProvider.of<AddProductCubit>(context).setCategory(category!);
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
            stream: BlocProvider.of<AddProductCubit>(context).outIsTitleValid,
            hintText: AppStrings.title,
            leadingIcon: Icons.label,
            errorText: AppStrings.invalidTitle,
          ),
          const SizedBox(height: AppSize.s16),
          MyStreamTextField(
            controller: widget.priceController,
            stream: BlocProvider.of<AddProductCubit>(context).outIsPriceValid,
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
            stream:
                BlocProvider.of<AddProductCubit>(context).outIsDescriptionValid,
            hintText: AppStrings.description,
            leadingIcon: Icons.text_snippet,
            errorText: AppStrings.invalidDesciption,
          ),
          const SizedBox(height: AppSize.s16),
          AddProductImageField(),
          const SizedBox(height: AppSize.s16),
          _buildCategoriesField(),
          const SizedBox(height: AppSize.s16),
          StreamBuilder<bool>(
            stream:
                BlocProvider.of<AddProductCubit>(context).outAreAllInputsValid,
            builder: (context, snapshot) {
              return MyButton(
                onPress: (snapshot.data ?? false)
                    ? () =>
                        BlocProvider.of<AddProductCubit>(context).addProduct()
                    : null,
                text: AppStrings.addAProduct,
              );
            },
          ),
        ],
      ),
    );
  }
}
