import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
    return Scaffold(
      appBar: const UserAppBar(title: 'Setting'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Theme Mode"),
            Row(
              children: [
                Switch(
                    value: viewModel.isDarkMode,
                    onChanged: (value) {
                      viewModel.updateMode(darkMode: value);
                    }),
                const SizedBox(
                  width: 20,
                ),
                Text(viewModel.isDarkMode ? "Dark Mode" : "Light Mode"),
              ],
            )
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
