import 'dart:async';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/add_product_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/product_model.dart';
import '../../common/product_freezed_data_classes.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState>
    with AddProductCubitInputs, AddProductCubitOutputs {
  final AddProductUseCase addProductUseCase;

  AddProductCubit({required this.addProductUseCase})
      : super(AddProductInitial());

  final StreamController _titleStreamController =
      StreamController<String>.broadcast();

  final StreamController _priceStreamController =
      StreamController<double>.broadcast();

  final StreamController _descriptionStreamController =
      StreamController<String>.broadcast();

  final StreamController _imageStreamController =
      StreamController<File>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var productObject = ProductObject(
    title: '',
    price: 0,
    description: '',
    image: '',
    category: '',
  );

  // inputs
  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputPrice => _priceStreamController.sink;

  @override
  Sink get inputDescription => _descriptionStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  void setTitle(String title) {
    inputTitle.add((title));
    productObject = productObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setPrice(double price) {
    inputPrice.add((price));
    productObject = productObject.copyWith(price: price);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setDescription(String description) {
    inputDescription.add((description));
    productObject = productObject.copyWith(description: description);
    inputAreAllInputsValid.add(null);
  }

  @override
  setImage(File image) {
    inputImage.add(image);
    if (image.path.isNotEmpty) {
      // update image in product object
      productObject = productObject.copyWith(image: image.path);
    } else {
      // reset image value in product object
      productObject = productObject.copyWith(image: '');
    }
    inputAreAllInputsValid.add(null);
  }

  @override
  void setCategory(String category) {
    if (category.isNotEmpty) {
      // update category in product object
      productObject = productObject.copyWith(category: category);
    } else {
      // reset category value in product object
      productObject = productObject.copyWith(category: '');
    }
    inputAreAllInputsValid.add(null);
  }

  @override
  void addProduct() async {
    emit(AddProductLoading());
    Either<Failure, void> response = await addProductUseCase(ProductModel(
      title: productObject.title,
      price: productObject.price,
      description: productObject.description,
      category: productObject.category,
      image: productObject.image,
    ));

    emit(response.fold(
        (failure) =>
            AddProductError(message: Constants.mapFailureToMsg(failure)),
        (success) => AddProductSuccess()));
  }

  // outputs
  @override
  Stream<bool> get outIsTitleValid => _titleStreamController.stream
      .map((title) => Constants.isTextValid(title));

  @override
  Stream<bool> get outIsPriceValid => _priceStreamController.stream
      .map((price) => Constants.isPriceValid(price));

  @override
  Stream<bool> get outIsDescriptionValid => _descriptionStreamController.stream
      .map((description) => Constants.isDescriptionValid(description));

  @override
  Stream<File> get outImage =>
      _imageStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => Constants.areAllProductInputsValid(productObject));
}

abstract class AddProductCubitInputs {
  void setTitle(String title);

  void setPrice(double price);

  void setDescription(String description);

  void setImage(File image);

  void setCategory(String category);

  void addProduct();

  Sink get inputTitle;

  Sink get inputPrice;

  Sink get inputDescription;

  Sink get inputImage;

  Sink get inputAreAllInputsValid;
}

abstract class AddProductCubitOutputs {
  Stream<bool> get outIsTitleValid;

  Stream<bool> get outIsPriceValid;

  Stream<bool> get outIsDescriptionValid;

  Stream<File> get outImage;

  Stream<bool> get outAreAllInputsValid;
}
