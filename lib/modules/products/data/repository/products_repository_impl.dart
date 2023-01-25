import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/modules/products/data/datasource/products_remote_data_source.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final NetworkInfo networkInfo;
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({
    required this.networkInfo,
    required this.productsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await productsRemoteDataSource.getAllProducts();
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(
      ProductDetailsParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductDetails =
            await productsRemoteDataSource.getProductDetails(parameters);
        return Right(remoteProductDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
