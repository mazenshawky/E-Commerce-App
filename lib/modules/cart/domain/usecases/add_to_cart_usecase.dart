import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/cart/data/models/cart_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/cart.dart';
import '../repository/cart_repository.dart';

class AddToCartUseCase implements BaseUseCase<Cart, CartModel> {
  final CartRepository cartRepository;

  AddToCartUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, Cart>> call(CartModel addToCartRequest) async {
    return await cartRepository.addToCart(addToCartRequest);
  }
}
