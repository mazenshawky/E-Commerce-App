class EndPoints {
  static const String baseUrl = "https://fakestoreapi.com";

  static const String loginPath = "$baseUrl/auth/login";

  static const String signupPath = "$baseUrl/users";

  static const String allProductsPath = "$baseUrl/products";

  static const String sortedProductsPath = "$baseUrl/products";

  static const String addProductPath = "$baseUrl/products";

  static const String allCategoriesPath = "$baseUrl/products/categories";

  static const String addToCartPath = "$baseUrl/carts";

  static String filteredProductsPath(String category) =>
      "$baseUrl/products/category/$category";

  static String userCartPath(int userId) => "$baseUrl/carts/user/$userId";

  static String productDetailsPath(int productId) =>
      "$baseUrl/products/$productId";

  static String editProductPath(int productId) =>
      "$baseUrl/products/$productId";

  static String deleteProductPath(int productId) =>
      "$baseUrl/products/$productId";

  static String deleteCartPath(int cartId) => "$baseUrl/carts/$cartId";

  static String userProfilePath(int userId) => "$baseUrl/users/$userId";

  static Map<String, dynamic> sortedProductsQuery(String sortType) => {
        'sort': sortType,
      };
}
