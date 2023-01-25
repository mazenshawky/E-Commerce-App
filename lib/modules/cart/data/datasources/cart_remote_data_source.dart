import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/cart_model.dart';
import '../../domain/usecases/get_cart_usecase.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(CartParameters parameters);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<CartModel> getCart(CartParameters parameters) async {
    final response =
        await apiConsumer.get(EndPoints.userCartPath(parameters.userId));

    return CartModel.fromJson(response[0]);
  }
}
