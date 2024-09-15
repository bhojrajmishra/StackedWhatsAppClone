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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Theme Switch Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Theme Mode"),
                  Row(
                    children: [
                      Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.updateMode(darkMode: value);
                        },
                      ),
                      const SizedBox(width: 20),
                      Text(themeProvider.isDarkMode
                          ? "Dark Mode"
                          : "Light Mode"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: viewModel.nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: viewModel.updateUserData,
                child: const Text('Update Profile'),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: viewModel.deleteAccount,
                child: const Text("Delete Account"),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: viewModel.logout,
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingViewModel viewModelBuilder(BuildContext context) => SettingViewModel();
}
