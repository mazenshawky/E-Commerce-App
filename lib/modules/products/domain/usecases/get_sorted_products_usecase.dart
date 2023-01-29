import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:equatable/equatable.dart';

class GetSortedProductsUseCase
    implements BaseUseCase<List<Product>, SortedProductsParameters> {
  final ProductsRepository productsRepository;

  GetSortedProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<Product>>> call(
      SortedProductsParameters parameters) async {
    return await productsRepository.getSortedProducts(parameters);
  }
}

class SortedProductsParameters extends Equatable {
  final String sortType;

  const SortedProductsParameters({required this.sortType});

  @override
  List<Object?> get props => [sortType];
}
