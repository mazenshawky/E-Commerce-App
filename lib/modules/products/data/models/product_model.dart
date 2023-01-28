import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: RatingModel.fromJson(json['rating']),
      );

  Map<String, dynamic> editProductToJson() => {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      };

  Map<String, dynamic> addProductToJson() => {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      };
}

class RatingModel extends Rating {
  const RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json['rate'].toDouble(),
        count: json['count'],
      );
}
