import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:equatable/equatable.dart';

class GetFilteredProductsUseCase
    implements BaseUseCase<List<Product>, FilteredProductsParameters> {
  final ProductsRepository productsRepository;

  GetFilteredProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<Product>>> call(
      FilteredProductsParameters parameters) async {
    return await productsRepository.getFilteredProducts(parameters);
  }
}

class FilteredProductsParameters extends Equatable {
  final String category;

  const FilteredProductsParameters({required this.category});

  @override
  List<Object?> get props => [category];
}
