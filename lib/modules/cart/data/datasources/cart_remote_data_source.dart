import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(UserParameters parameters);

  Future<void> addToCart(CartModel addToCartRequest);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<CartModel> getCart(UserParameters parameters) async {
    final response =
        await apiConsumer.get(EndPoints.userCartPath(parameters.userId));

    return CartModel.fromJson(response[0]);
  }

  @override
  Future<void> addToCart(CartModel addToCartRequest) async =>
      await apiConsumer.post(
        EndPoints.addToCartPath,
        body: addToCartRequest.toJson(),
      );
}
