// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_all_products_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../../domain/entities/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  ProductsCubit({required this.getAllProductsUseCase})
      : super(ProductsInitial());

  List<Product> allProducts = [];

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    Either<Failure, List<Product>> response =
        await getAllProductsUseCase(const NoParameters());

    emit(response.fold(
        (failure) => ProductsError(message: Constants.mapFailureToMsg(failure)),
        (products) {
      allProducts = products;
      return ProductsLoaded(products: products);
    }));
  }
}
