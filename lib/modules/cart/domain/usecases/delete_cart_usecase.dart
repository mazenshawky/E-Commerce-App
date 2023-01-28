import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repository/cart_repository.dart';

class DeleteCartUseCase implements BaseUseCase<void, DeleteCartParameters> {
  final CartRepository cartRepository;

  DeleteCartUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, void>> call(DeleteCartParameters parameters) async {
    return await cartRepository.deleteCart(parameters);
  }
}

class DeleteCartParameters extends Equatable {
  final int cartId;

  const DeleteCartParameters({required this.cartId});

  @override
  List<Object?> get props => [cartId];
}
