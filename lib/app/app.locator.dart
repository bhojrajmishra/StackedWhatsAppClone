// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:whats_app_clone/ui/views/home/repository/user_list_repository_impl.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository.dart';
import 'package:whats_app_clone/ui/views/login/repository/login_repository_impl.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository.dart';
import 'package:whats_app_clone/ui/views/registration/repository/registration_repository_impl.dart';
import 'package:whats_app_clone/ui/views/registration/service/registration_service.dart';

import '../ui/views/home/service/home_service.dart';
import '../ui/views/login/service/login_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => HomeService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => UserListRepositoryImpl());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImplementation());
  locator.registerLazySingleton(() => RegistrationService());
  locator.registerLazySingleton<RegistrationRepository>(
      () => RegistrationRepositoryImplementation());
}
