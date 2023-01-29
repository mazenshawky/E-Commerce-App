import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/api/api_consumer.dart';
import 'package:e_commerce_app/modules/products/data/models/product_model.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/delete_product_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_filtered_products.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getFilteredProducts(
      FilteredProductsParameters parameters);

  Future<List<String>> getAllCategories();

  Future<ProductModel> getProductDetails(ProductDetailsParameters parameters);

  Future<void> addProduct(ProductModel addProductRequest);

  Future<void> editProduct(ProductModel editProductRequest);

  Future<void> deleteProduct(DeleteProductParameters parameters);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ApiConsumer apiConsumer;

  ProductsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await apiConsumer.get(EndPoints.allProductsPath);

    return List<ProductModel>.from(
        (response as List).map((product) => ProductModel.fromJson(product)));
  }

  @override
  Future<List<ProductModel>> getFilteredProducts(
      FilteredProductsParameters parameters) async {
    final response = await apiConsumer
        .get(EndPoints.filteredProductsPath(parameters.category));

    return List<ProductModel>.from(
        (response as List).map((product) => ProductModel.fromJson(product)));
  }

  @override
  Future<List<String>> getAllCategories() async {
    final response = await apiConsumer.get(EndPoints.allCategoriesPath);

    return List<String>.from(
        (response as List).map((categoryName) => categoryName.toString()));
  }

  @override
  Future<ProductModel> getProductDetails(
      ProductDetailsParameters parameters) async {
    final response = await apiConsumer
        .get(EndPoints.productDetailsPath(parameters.productId));

    return ProductModel.fromJson(response);
  }

  @override
  Future<void> addProduct(ProductModel addProductRequest) async =>
      await apiConsumer.post(
        EndPoints.addProductPath,
        body: addProductRequest.addProductToJson(),
      );

  @override
  Future<void> editProduct(ProductModel editProductRequest) async =>
      await apiConsumer.put(
        EndPoints.editProductPath(editProductRequest.id!),
        body: editProductRequest.editProductToJson(),
      );

  @override
  Future<void> deleteProduct(DeleteProductParameters parameters) async =>
      await apiConsumer
          .delete(EndPoints.deleteProductPath(parameters.productId));
}
