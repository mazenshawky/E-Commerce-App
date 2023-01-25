class EndPoints {
  static const String baseUrl = "https://fakestoreapi.com";

  static const String allProductsPath = "$baseUrl/products";

  static String userCartPath(int userId) => "$baseUrl/carts/user/$userId";

  static String productDetailsPath(int productId) =>
      "$baseUrl/products/$productId";
}
