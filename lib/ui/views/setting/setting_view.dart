import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.bottomsheets.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/theme/theme_modification.dart';
import 'package:whats_app_clone/ui/views/setting/widgets/bottom_sheet.dart';
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
                onPressed: viewModel.logout, child: const Text("Logout")),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Column(
                  children: [
                    Text("Full Name: ${viewModel.userData?['name'] ?? ''}"),
                    Text("Email: ${viewModel.userData?['email'] ?? ''}"),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.deleteAccount();
                    },
                    child: const Text("delete profile")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (context) {
                      //       return UpdateProfileSheet(
                      //         completer: viewModel.updateUserData(
                      //             name: name, email: email),
                      //         request: SheetRequest(
                      //           title: "Update Profile",
                      //           data: viewModel.userData,
                      //         ),
                      //       );
                      //     });
                    },
                    child: const Text('Update Profile')),
              ],
            )

            // Display user data
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
