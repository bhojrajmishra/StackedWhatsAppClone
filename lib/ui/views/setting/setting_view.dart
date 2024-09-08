import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/theme/theme_modification.dart';
import 'package:whats_app_clone/ui/widgets/user_app_bar.dart';

import 'setting_viewmodel.dart';

class SettingView extends StackedView<SettingViewModel> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingViewModel viewModel,
    Widget? child,
  ) {
    final themeProvider = context.watch<ThemeModification>();
    return Scaffold(
      appBar: const UserAppBar(title: 'Setting'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Theme Mode"),
                Row(
                  children: [
                    Switch(
                        value: context.watch<ThemeModification>().isDarkMode,
                        onChanged: (value) {
                          themeProvider.updateMode(darkMode: value);
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(themeProvider.isDarkMode ? "Dark Mode" : "Light Mode"),
                  ],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: viewModel.deleteTOken, child: const Text("Logout"))
          ],
        ),
      ),
    );
  }

  @override
  SettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingViewModel();
}
