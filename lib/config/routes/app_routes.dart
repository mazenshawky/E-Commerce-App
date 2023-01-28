import 'package:e_commerce_app/modules/auth/presentation/screens/login/login_screen.dart';
import 'package:e_commerce_app/modules/auth/presentation/screens/signup/signup_screen.dart';
import 'package:e_commerce_app/modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_app/modules/products/presentation/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/app/injection_container.dart' as di;

import '../../modules/auth/presentation/cubit/login/login_cubit.dart';
import '../../modules/auth/presentation/cubit/profile/profile_cubit.dart';
import '../../modules/auth/presentation/cubit/signup/signup_cubit.dart';
import '../../modules/cart/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import '../../modules/cart/presentation/cubit/cart/cart_cubit.dart';
import '../../modules/products/presentation/cubit/categories/categories_cubit.dart';
import '../../modules/products/presentation/cubit/delete_product/delete_product_cubit.dart';
import '../../modules/products/presentation/cubit/edit_product/edit_product_cubit.dart';
import '../../modules/products/presentation/cubit/products/products_cubit.dart';
import '../../modules/products/presentation/screens/edit_product/edit_product_screen.dart';
import '../../modules/splash/presentation/screens/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeRoute = '/home';
  static const String productDetailsRoute = '/product-details';
  static const String editProductRoute = '/edit-product';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signupRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<ProductsCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<CategoriesCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<CartCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<ProfileCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.productDetailsRoute:
        final productId = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<ProductDetailsCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<AddToCartCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<DeleteProductCubit>(),
              ),
            ],
            child: ProductDetailsScreen(productId: productId),
          ),
        );

      case Routes.editProductRoute:
        final product = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<EditProductCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<CategoriesCubit>(),
              ),
            ],
            child: EditProductScreen(product: product),
          ),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
