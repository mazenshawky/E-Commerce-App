import 'package:e_commerce_app/modules/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.id,
    required super.cartProducts,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        cartProducts: List<CartProduct>.from(json['products']
            .map((cartProduct) => CartProductModel.fromJson(cartProduct))),
      );
}

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.productId,
    required super.quantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        productId: json['productId'],
        quantity: json['quantity'],
      );
}
