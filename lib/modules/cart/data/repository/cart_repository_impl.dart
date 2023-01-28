import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/cart/data/datasources/cart_remote_data_source.dart';
import 'package:e_commerce_app/modules/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/modules/cart/domain/usecases/delete_cart_usecase.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final NetworkInfo networkInfo;
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({
    required this.networkInfo,
    required this.cartRemoteDataSource,
  });

  @override
  Future<Either<Failure, Cart>> getCart(UserParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCart = await cartRemoteDataSource.getCart(parameters);
        return Right(remoteCart);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(CartModel addToCartRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await cartRemoteDataSource.addToCart(addToCartRequest);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCart(
      DeleteCartParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await cartRemoteDataSource.deleteCart(parameters);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
