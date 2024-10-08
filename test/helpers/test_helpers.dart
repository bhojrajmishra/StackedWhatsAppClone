import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:whats_app_clone/ui/views/home/service/home_service.dart';
// import 'package:whats_app_clone/services/secure_storage_service.dart';
import 'package:whats_app_clone/ui/views/login/service/login_service.dart';
import 'package:whats_app_clone/services/login_repository_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  // MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HomeService>(onMissingStub: OnMissingStub.returnDefault),
  // MockSpec<RegistrationService>(onMissingStub: OnMissingStub.returnDefault),
  // MockSpec<SecureStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginRepositoryService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  // getAndRegisterLoginService();
  getAndRegisterHomeService();
  // getAndRegisterRegistrationService();
  // getAndRegisterSecureStorageService();
  getAndRegisterLoginService();
  getAndRegisterLoginRepositoryService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

// MockLoginService getAndRegisterLoginService() {
//   _removeRegistrationIfExists<LoginService>();
//   final service = MockLoginService();
//   locator.registerSingleton<LoginService>(service);
//   return service;
// }

MockHomeService getAndRegisterHomeService() {
  _removeRegistrationIfExists<HomeService>();
  final service = MockHomeService();
  locator.registerSingleton<HomeService>(service);
  return service;
}

// MockRegistrationService getAndRegisterRegistrationService() {
//   _removeRegistrationIfExists<RegistrationService>();
//   final service = MockRegistrationService();
//   locator.registerSingleton<RegistrationService>(service);
//   return service;
// }

// MockSecureStorageService getAndRegisterSecureStorageService() {
//   _removeRegistrationIfExists<SecureStorageService>();
//   final service = MockSecureStorageService();
//   locator.registerSingleton<SecureStorageService>(service);
//   return service;
// }
MockLoginService getAndRegisterLoginService() {
  _removeRegistrationIfExists<LoginService>();
  final service = MockLoginService();
  locator.registerSingleton<LoginService>(service);
  return service;
}

MockLoginRepositoryService getAndRegisterLoginRepositoryService() {
  _removeRegistrationIfExists<LoginRepositoryService>();
  final service = MockLoginRepositoryService();
  locator.registerSingleton<LoginRepositoryService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
