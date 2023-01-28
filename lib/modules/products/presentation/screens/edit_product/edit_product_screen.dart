import 'package:e_commerce_app/modules/products/presentation/components/edit_product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../core/widgets/my_header.dart';
import '../../../../../core/widgets/state_popups.dart';
import '../../cubit/categories/categories_cubit.dart';
import '../../cubit/edit_product/edit_product_cubit.dart';

class EditProductScreen extends StatefulWidget {
  final dynamic product;

  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _editProductFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _getAllCategories();
    _bind();
  }

  void _getAllCategories() async =>
      await BlocProvider.of<CategoriesCubit>(context).getAllCategories();

  void _bind() {
    _titleController.addListener(() =>
        BlocProvider.of<EditProductCubit>(context)
            .setTitle(_titleController.text));

    _priceController.addListener(() =>
        BlocProvider.of<EditProductCubit>(context).setPrice(double.parse(
            _priceController.text.isNotEmpty ? _priceController.text : '0')));

    _descriptionController.addListener(() =>
        BlocProvider.of<EditProductCubit>(context)
            .setDescription(_descriptionController.text));
  }

  Widget _buildEditProductButtonPressedBloc() {
    return BlocListener<EditProductCubit, EditProductState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is EditProductLoading) {
          statePopUpLoading(context);
        }
        if (state is EditProductSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          statePopUpSuccess(context, text: AppStrings.editedSuccessfully);
        }
        if (state is EditProductError) {
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
      appBar: myAppBar(title: AppStrings.editProduct),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s150,
              child: MyHeader(height: AppSize.s150),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20, vertical: AppPadding.p10),
              margin: const EdgeInsets.symmetric(
                  horizontal: AppMargins.m20, vertical: AppMargins.m10),
              child: EditProductForm(
                titleController: _titleController,
                priceController: _priceController,
                descriptionController: _descriptionController,
                editProductFormKey: _editProductFormKey,
                product: widget.product,
              ),
            ),
            _buildEditProductButtonPressedBloc(),
          ],
        ),
      ),
    );
  }
}
