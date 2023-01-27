// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/app/app_prefs.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/get_profile_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final AppPreferences appPreferences;

  ProfileCubit({required this.getProfileUseCase, required this.appPreferences})
      : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    Either<Failure, User> response =
        await getProfileUseCase(UserParameters(userId: _getUserId()));

    emit(response.fold(
      (failure) => ProfileError(message: Constants.mapFailureToMsg(failure)),
      (user) => ProfileLoaded(user: user),
    ));
  }

  int _getUserId() => appPreferences.getUserId();
}
