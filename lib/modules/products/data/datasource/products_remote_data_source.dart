import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/api/api_consumer.dart';
import 'package:e_commerce_app/modules/products/data/models/product_model.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<List<String>> getAllCategories();

  Future<ProductModel> getProductDetails(ProductDetailsParameters parameters);

  Future<void> editProduct(ProductModel editProductRequest);
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
  Future<void> editProduct(ProductModel editProductRequest) async =>
      await apiConsumer.put(
        EndPoints.editProductPath(editProductRequest.id!),
        body: editProductRequest.editProductToJson(),
      );
}
