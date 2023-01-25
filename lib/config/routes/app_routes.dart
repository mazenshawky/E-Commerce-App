import 'package:e_commerce_app/modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_app/modules/products/presentation/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/app/injection_container.dart' as di;

import '../../modules/cart/presentation/cubit/cart/cart_cubit.dart';
import '../../modules/products/presentation/cubit/products/products_cubit.dart';

class Routes {
  static const String initialRoute = '/';
  static const String productDetailsRoute = '/product-details';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        // final userId = routeSettings.arguments;
        return MaterialPageRoute(
            builder: ((context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => di.sl<ProductsCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => di.sl<CartCubit>(),
                    ),
                  ],
                  // child: HomeScreen(userId: userId),
                  child: const HomeScreen(userId: 2),
                )));
      case Routes.productDetailsRoute:
        final productId = routeSettings.arguments;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<ProductDetailsCubit>(),
                  child: ProductDetailsScreen(productId: productId),
                ));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(child: Text(AppStrings.noRouteFound)),
            )));
  }
}
