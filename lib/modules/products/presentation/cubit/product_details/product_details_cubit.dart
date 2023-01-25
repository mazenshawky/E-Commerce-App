// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  ProductDetailsCubit({required this.getProductDetailsUseCase})
      : super(ProductDetailsInitial());

  Future<void> getProductDetails(int productId) async {
    emit(ProductDetailsLoading());
    Either<Failure, Product> response = await getProductDetailsUseCase(
        ProductDetailsParameters(productId: productId));

    emit(response.fold(
        (failure) =>
            ProductDetailsError(message: Constants.mapFailureToMsg(failure)),
        (productDetails) =>
            ProductDetailsLoaded(productDetails: productDetails)));
  }
}
