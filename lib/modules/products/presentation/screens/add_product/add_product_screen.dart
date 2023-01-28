import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../core/widgets/my_header.dart';
import '../../components/add_product_form.dart';
import '../../cubit/add_product/add_product_cubit.dart';

class AddProductScreen extends StatefulWidget {
  final List<String> categories;

  const AddProductScreen({
    super.key,
    required this.categories,
  });

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _editProductFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  void _bind() {
    _titleController.addListener(() => BlocProvider.of<AddProductCubit>(context)
        .setTitle(_titleController.text));

    _priceController.addListener(() => BlocProvider.of<AddProductCubit>(context)
        .setPrice(double.parse(
            _priceController.text.isNotEmpty ? _priceController.text : '0')));

    _descriptionController.addListener(() =>
        BlocProvider.of<AddProductCubit>(context)
            .setDescription(_descriptionController.text));
  }

  Widget _buildAddProductButtonPressedBloc() {
    return BlocListener<AddProductCubit, AddProductState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is AddProductLoading) {
          Constants.statePopUpLoading(context);
        }
        if (state is AddProductSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          Constants.statePopUpSuccess(context,
              text: AppStrings.addedSuccessfully);
        }
        if (state is AddProductError) {
          Navigator.pop(context);
          Constants.statePopUpError(context, text: state.message);
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: AppStrings.addAProduct),
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
              child: AddProductForm(
                titleController: _titleController,
                priceController: _priceController,
                descriptionController: _descriptionController,
                editProductFormKey: _editProductFormKey,
                categories: widget.categories,
              ),
            ),
            _buildAddProductButtonPressedBloc(),
          ],
        ),
      ),
    );
  }
}
