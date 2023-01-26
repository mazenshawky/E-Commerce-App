// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  Future<void> signup(SignupParameters parameters) async {
    emit(SignupLoading());
    Either<Failure, void> response = await signupUseCase(parameters);

    emit(response.fold(
      (failure) => SignupError(message: Constants.mapFailureToMsg(failure)),
      (user) => SignupSuccess(),
    ));
  }
}
