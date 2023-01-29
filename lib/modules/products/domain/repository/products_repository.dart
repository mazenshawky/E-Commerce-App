import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/products/data/models/product_model.dart';
import 'package:e_commerce_app/modules/products/domain/entities/product.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

import '../../../../core/error/failure.dart';
import '../usecases/delete_product_usecase.dart';
import '../usecases/get_filtered_products.dart';
import '../usecases/get_sorted_products.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, List<Product>>> getFilteredProducts(
      FilteredProductsParameters parameters);

  Future<Either<Failure, List<Product>>> getSortedProducts(
      SortedProductsParameters parameters);

  Future<Either<Failure, List<String>>> getAllCategories();

  Future<Either<Failure, Product>> getProductDetails(
      ProductDetailsParameters parameters);

  Future<Either<Failure, void>> addProduct(ProductModel addProductRequest);

  Future<Either<Failure, void>> editProduct(ProductModel editProductRequest);

  Future<Either<Failure, void>> deleteProduct(
      DeleteProductParameters parameters);
}
