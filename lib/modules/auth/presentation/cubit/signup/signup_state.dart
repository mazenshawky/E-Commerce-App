part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final User user;

  const SignupSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class SignupError extends SignupState {
  final String message;

  const SignupError({required this.message});

  @override
  List<Object> get props => [message];
}
