import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../usecases/get_cart_usecase.dart';
import '../entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart(CartParameters parameters);
}
