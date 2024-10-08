import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/app/app.bottomsheets.dart';
import 'package:whats_app_clone/app/app.dialogs.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/base/utils/firebase_remote_configuration.dart';
import 'package:whats_app_clone/firebase_options.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';
import 'package:whats_app_clone/theme/theme_modification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    // Initialize Remote Config
    final remoteConfig = FirebaseRemoteConfig.instance;
    await RemoteConfigService.initialize(remoteConfig);

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // final firebaseRemoteConfigService = FirebaseRemoteConfigService(
    //   firebaseRemoteConfig: FirebaseRemoteConfig.instance,
    // );
    // await firebaseRemoteConfigService.init();

    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  } catch (e) {
    debugPrint("Failed to initialize Firebase: $e");
  }

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModification(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    final themeProvider = Provider.of<ThemeModification>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      theme: themeProvider.isDarkMode
          ? CustomTheme.darkTheme()
          : CustomTheme.lightTheme(),
    );
  }
}
