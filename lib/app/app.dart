import 'package:whats_app_clone/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:whats_app_clone/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:whats_app_clone/ui/views/home/home_view.dart';
import 'package:whats_app_clone/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/ui/views/login/login_view.dart';
import 'package:whats_app_clone/services/login_service.dart';
import 'package:whats_app_clone/services/home_service.dart';
import 'package:whats_app_clone/ui/views/chat/chat_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ChatView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: HomeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
