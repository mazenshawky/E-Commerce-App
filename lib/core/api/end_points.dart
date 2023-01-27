class EndPoints {
  static const String baseUrl = "https://fakestoreapi.com";

  static const String signupPath = "$baseUrl/users";

  static const String allProductsPath = "$baseUrl/products";

  static const String addToCartPath = "$baseUrl/carts";

  static String userCartPath(int userId) => "$baseUrl/carts/user/$userId";

  static String productDetailsPath(int productId) =>
      "$baseUrl/products/$productId";

  static String userProfilePath(int userId) => "$baseUrl/users/$userId";
}
