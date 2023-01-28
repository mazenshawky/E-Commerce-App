import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repository/products_repository.dart';

class DeleteProductUseCase
    implements BaseUseCase<void, DeleteProductParameters> {
  final ProductsRepository productsRepository;

  DeleteProductUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, void>> call(DeleteProductParameters parameters) async {
    return await productsRepository.deleteProduct(parameters);
  }
}

class DeleteProductParameters extends Equatable {
  final int productId;

  const DeleteProductParameters({required this.productId});

  @override
  List<Object?> get props => [productId];
}
