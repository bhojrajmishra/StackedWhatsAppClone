import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/app/app.bottomsheets.dart';
import 'package:whats_app_clone/app/app.dialogs.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/firebase_options.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';
import 'package:whats_app_clone/theme/theme_modification.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
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
