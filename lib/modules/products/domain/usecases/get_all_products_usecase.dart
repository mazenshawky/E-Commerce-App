import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';

class GetAllProductsUseCase
    implements BaseUseCase<List<Product>, NoParameters> {
  final ProductsRepository productsRepository;

  GetAllProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<Product>>> call(NoParameters parameters) async {
    return await productsRepository.getAllProducts();
  }
}
