import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/products/data/models/product_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repository/products_repository.dart';

class AddProductUseCase implements BaseUseCase<void, ProductModel> {
  final ProductsRepository productsRepository;

  AddProductUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, void>> call(ProductModel addProductRequest) async {
    return await productsRepository.addProduct(addProductRequest);
  }
}
