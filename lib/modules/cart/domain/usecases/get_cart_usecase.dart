import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/cart.dart';
import '../repository/cart_repository.dart';

class GetCartUseCase implements BaseUseCase<Cart, UserParameters> {
  final CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, Cart>> call(UserParameters parameters) async {
    return await cartRepository.getCart(parameters);
  }
}
