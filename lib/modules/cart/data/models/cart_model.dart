import 'package:e_commerce_app/modules/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    super.id,
    super.userId,
    super.date,
    super.cartProducts,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        cartProducts: List<CartProductModel>.from(json['products']
            .map((cartProduct) => CartProductModel.fromJson(cartProduct))),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'date': date.toString(),
        'products':
            cartProducts!.map((cartProduct) => cartProduct.toJson()).toList(),
      };
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
