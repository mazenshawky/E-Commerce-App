// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/get_profile_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitial());

  Future<void> getProfile(int userId) async {
    emit(ProfileLoading());
    Either<Failure, User> response =
        await getProfileUseCase(UserParameters(userId: userId));

    emit(response.fold(
      (failure) => ProfileError(message: Constants.mapFailureToMsg(failure)),
      (user) => ProfileLoaded(user: user),
    ));
  }
}
