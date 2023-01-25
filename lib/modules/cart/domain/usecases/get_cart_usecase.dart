import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/cart.dart';
import '../repository/cart_repository.dart';

class GetCartUseCase implements BaseUseCase<Cart, CartParameters> {
  final CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, Cart>> call(CartParameters parameters) async {
    return await cartRepository.getCart(parameters);
  }
}

class CartParameters extends Equatable {
  final int userId;

  const CartParameters({required this.userId});

  @override
  List<Object?> get props => [userId];
}
