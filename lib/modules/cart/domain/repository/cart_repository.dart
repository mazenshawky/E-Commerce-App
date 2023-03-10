import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/cart/data/models/cart_model.dart';

import '../../../../core/error/failure.dart';
import '../entities/cart.dart';
import '../usecases/delete_cart_usecase.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart(UserParameters parameters);

  Future<Either<Failure, void>> addToCart(CartModel addToCartRequest);

  Future<Either<Failure, void>> deleteCart(DeleteCartParameters parameters);
}
