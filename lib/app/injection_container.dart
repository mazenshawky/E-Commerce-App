import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_consumer.dart';
import 'package:e_commerce_app/core/api/app_interceptors.dart';
import 'package:e_commerce_app/core/api/dio_consumer.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/modules/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_commerce_app/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/modules/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/get_profile_usecase.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/signup_usecase.dart';
import 'package:e_commerce_app/modules/auth/presentation/cubit/login/login_cubit.dart';
import 'package:e_commerce_app/modules/auth/presentation/cubit/profile/profile_cubit.dart';
import 'package:e_commerce_app/modules/cart/data/repository/cart_repository_impl.dart';
import 'package:e_commerce_app/modules/cart/domain/repository/cart_repository.dart';
import 'package:e_commerce_app/modules/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_app/modules/cart/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import 'package:e_commerce_app/modules/products/data/datasource/products_remote_data_source.dart';
import 'package:e_commerce_app/modules/products/data/repository/products_repository_impl.dart';
import 'package:e_commerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/edit_product_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_all_products_usecase.dart';
import 'package:e_commerce_app/modules/cart/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';
import 'package:e_commerce_app/modules/products/presentation/cubit/edit_product/edit_product_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/auth/domain/usecases/login_usecase.dart';
import '../modules/auth/presentation/cubit/signup/signup_cubit.dart';
import '../modules/cart/data/datasources/cart_remote_data_source.dart';
import '../modules/cart/domain/usecases/delete_cart_usecase.dart';
import '../modules/cart/presentation/cubit/cart/cart_cubit.dart';
import '../modules/cart/presentation/cubit/delete_cart/delete_cart_cubit.dart';
import '../modules/products/domain/usecases/add_product_usecase.dart';
import '../modules/products/domain/usecases/delete_product_usecase.dart';
import '../modules/products/domain/usecases/get_all_categories_usecase.dart';
import '../modules/products/domain/usecases/get_filtered_products.dart';
import '../modules/products/domain/usecases/get_sorted_products.dart';
import '../modules/products/presentation/cubit/add_product/add_product_cubit.dart';
import '../modules/products/presentation/cubit/categories/categories_cubit.dart';
import '../modules/products/presentation/cubit/delete_product/delete_product_cubit.dart';
import '../modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import '../modules/products/presentation/cubit/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'app_prefs.dart';
import 'bloc_observer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Modules
  // Blocs
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl()));
  sl.registerFactory<SignupCubit>(() => SignupCubit(signupUseCase: sl()));
  sl.registerFactory<ProfileCubit>(
      () => ProfileCubit(getProfileUseCase: sl(), appPreferences: sl()));

  sl.registerLazySingleton<ProductsCubit>(() => ProductsCubit(
        getAllProductsUseCase: sl(),
        getFilteredProductsUseCase: sl(),
        getSortedProductsUseCase: sl(),
      ));
  sl.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getAllCategoriesUseCase: sl()));
  sl.registerFactory<ProductDetailsCubit>(
      () => ProductDetailsCubit(getProductDetailsUseCase: sl()));
  sl.registerFactory<AddProductCubit>(
      () => AddProductCubit(addProductUseCase: sl()));
  sl.registerFactory<EditProductCubit>(
      () => EditProductCubit(editProductUseCase: sl()));
  sl.registerFactory<DeleteProductCubit>(
      () => DeleteProductCubit(deleteProductUseCase: sl()));

  sl.registerFactory<CartCubit>(
      () => CartCubit(getCartUseCase: sl(), appPreferences: sl()));
  sl.registerFactory<AddToCartCubit>(
      () => AddToCartCubit(addToCartUseCase: sl(), appPreferences: sl()));
  sl.registerFactory<DeleteCartCubit>(
      () => DeleteCartCubit(deleteCartUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(authRepository: sl()));
  sl.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(authRepository: sl()));

  sl.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(productsRepository: sl()));
  sl.registerLazySingleton<GetFilteredProductsUseCase>(
      () => GetFilteredProductsUseCase(productsRepository: sl()));
  sl.registerLazySingleton<GetSortedProductsUseCase>(
      () => GetSortedProductsUseCase(productsRepository: sl()));
  sl.registerLazySingleton<GetAllCategoriesUseCase>(
      () => GetAllCategoriesUseCase(productsRepository: sl()));
  sl.registerLazySingleton<GetProductDetailsUseCase>(
      () => GetProductDetailsUseCase(productsRepository: sl()));
  sl.registerLazySingleton<AddProductUseCase>(
      () => AddProductUseCase(productsRepository: sl()));
  sl.registerLazySingleton<EditProductUseCase>(
      () => EditProductUseCase(productsRepository: sl()));
  sl.registerLazySingleton<DeleteProductUseCase>(
      () => DeleteProductUseCase(productsRepository: sl()));

  sl.registerLazySingleton<GetCartUseCase>(
      () => GetCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<AddToCartUseCase>(
      () => AddToCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<DeleteCartUseCase>(
      () => DeleteCartUseCase(cartRepository: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        networkInfo: sl(),
        authRemoteDataSource: sl(),
        sharedPreferences: sl(),
      ));
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
        networkInfo: sl(),
        productsRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        networkInfo: sl(),
        cartRemoteDataSource: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<AppPreferences>(
      (() => AppPreferencesImpl(sharedPreferences: sl())));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppBlocObserver());
  sl.registerFactory<ImagePicker>(() => ImagePicker());
}

void initBlocObserver() {
  Bloc.observer = sl<AppBlocObserver>();
}
