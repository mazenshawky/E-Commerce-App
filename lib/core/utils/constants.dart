import '../error/failure.dart';
import 'app_strings.dart';

class Constants {
  static String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      case InternetFailure:
        return AppStrings.internetFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
