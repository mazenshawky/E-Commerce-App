import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';

class GetAllCategoriesUseCase
    implements BaseUseCase<List<String>, NoParameters> {
  final ProductsRepository productsRepository;

  GetAllCategoriesUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<String>>> call(NoParameters parameters) async {
    return await productsRepository.getAllCategories();
  }
}
