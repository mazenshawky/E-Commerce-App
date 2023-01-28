// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/get_all_categories_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';
import '../../../../../core/utils/constants.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  CategoriesCubit({required this.getAllCategoriesUseCase})
      : super(CategoriesInitial());

  List<String> allCategories = [];

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    Either<Failure, List<String>> response =
        await getAllCategoriesUseCase(const NoParameters());

    emit(response.fold(
        (failure) =>
            CategoriesError(message: Constants.mapFailureToMsg(failure)),
        (categories) {
      allCategories = categories;
      return CategoriesLoaded(categories: categories);
    }));
  }
}
