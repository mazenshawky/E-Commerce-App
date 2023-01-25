import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/api/api_consumer.dart';
import 'package:e_commerce_app/modules/products/data/models/product_model.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<ProductModel> getProductDetails(ProductDetailsParameters parameters);
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
  Future<ProductModel> getProductDetails(
      ProductDetailsParameters parameters) async {
    final response = await apiConsumer
        .get(EndPoints.productDetailsPath(parameters.productId));

    return ProductModel.fromJson(response);
  }
}
