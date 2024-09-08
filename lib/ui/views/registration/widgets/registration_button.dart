import 'package:flutter/material.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';
import 'package:whats_app_clone/ui/views/registration/registration_view.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const RegistrationView();
            }));
          },
          child: Text(
            "Register here!",
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
