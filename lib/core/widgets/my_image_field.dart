// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce_app/app/injection_container.dart' as di;

import '../../modules/products/presentation/cubit/edit_product/edit_product_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_values.dart';
import '../utils/constants.dart';

class MyImageField extends StatelessWidget {
  final ImagePicker _imagePicker = di.sl<ImagePicker>();
  final String preImage;

  MyImageField({super.key, required this.preImage});

  _imageFromGallery(BuildContext context) async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    BlocProvider.of<EditProductCubit>(context)
        .setImage(File(image?.path ?? ""));
  }

  _imageFromCamera(BuildContext context) async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    BlocProvider.of<EditProductCubit>(context)
        .setImage(File(image?.path ?? ""));
  }

  Widget _imagePickedByUser(BuildContext context, File? image) {
    if (image != null && image.path.isNotEmpty) {
      return Image.file(image);
    } else {
      BlocProvider.of<EditProductCubit>(context).setImage(File(''));
      return Image.network(preImage);
    }
  }

  Widget _getMediaWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(child: Text(AppStrings.image)),
          Flexible(
              child: StreamBuilder<File>(
            stream: BlocProvider.of<EditProductCubit>(context).outImage,
            builder: (context, snapshot) {
              return _imagePickedByUser(context, snapshot.data);
            },
          )),
          const Flexible(
            child: Icon(Icons.camera_alt, color: AppColors.blackColor45),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s48,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      child: GestureDetector(
        onTap: () {
          Constants.showPicker(
            context,
            galleryPressed: () {
              _imageFromGallery(context);
              Navigator.pop(context);
            },
            cameraPressed: () {
              _imageFromCamera(context);
              Navigator.pop(context);
            },
          );
        },
        child: _getMediaWidget(context),
      ),
    );
  }
}
