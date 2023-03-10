import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/modules/products/data/datasource/products_remote_data_source.dart';
import 'package:e_commerce_app/modules/products/data/models/product_model.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/delete_product_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_filtered_products_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_limited_proudcts_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_sorted_products_usecase.dart';

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
  Future<Either<Failure, List<Product>>> getFilteredProducts(
      FilteredProductsParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts =
            await productsRemoteDataSource.getFilteredProducts(parameters);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getSortedProducts(
      SortedProductsParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts =
            await productsRemoteDataSource.getSortedProducts(parameters);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getLimitedProducts(
      LimitedProductsParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts =
            await productsRemoteDataSource.getLimitedProducts(parameters);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategories =
            await productsRemoteDataSource.getAllCategories();
        return Right(remoteCategories);
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

  @override
  Future<Either<Failure, void>> addProduct(
      ProductModel addProductRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await productsRemoteDataSource.addProduct(addProductRequest);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editProduct(
      ProductModel editProductRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await productsRemoteDataSource.editProduct(editProductRequest);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(
      DeleteProductParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await productsRemoteDataSource.deleteProduct(parameters);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
