import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(UserParameters parameters);
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
}
