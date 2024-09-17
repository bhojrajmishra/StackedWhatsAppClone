import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whats_app_clone/app/app.locator.dart';
import 'package:whats_app_clone/app/app.router.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';

class RegistrationButton extends StatelessWidget {
  final String textData;
  final void Function()? onTap;

  const RegistrationButton(
      {super.key, required this.textData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            textData,
            style: TextStyle(
              color: CustomTheme.primary(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
