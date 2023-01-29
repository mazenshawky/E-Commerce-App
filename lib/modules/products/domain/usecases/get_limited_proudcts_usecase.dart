import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:equatable/equatable.dart';

class GetLimitedProductsUseCase
    implements BaseUseCase<List<Product>, LimitedProductsParameters> {
  final ProductsRepository productsRepository;

  GetLimitedProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<Product>>> call(
      LimitedProductsParameters parameters) async {
    return await productsRepository.getLimitedProducts(parameters);
  }
}

class LimitedProductsParameters extends Equatable {
  final String limit;

  const LimitedProductsParameters({required this.limit});

  @override
  List<Object?> get props => [limit];
}
