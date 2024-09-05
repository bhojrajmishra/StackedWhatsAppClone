import 'package:flutter/material.dart';

/// A custom theme class that defines the light and dark themes for the application.
///
/// This class provides two static methods, [lightTheme] and [darkTheme], which return
/// [ThemeData] objects configured with specific color schemes for light and dark modes.
class CustomTheme {
  /// Defines the light theme of the app.
  ///
  /// This method returns a [ThemeData] object configured with a [ColorScheme.light].
  /// The primary color is set to a shade of green, while the secondary and surface colors are set to white
  ///
  /// The [inversePrimary] color is also set to white, which is used when contrasting with
  /// a primary color that requires inversion in some UI elements.
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surface: Colors.white, // Background surface color for components
        primary: Color.fromARGB(
            255, 16, 83, 18), // Primary color used in the app's theme
        secondary: Colors.white, // Secondary color, often used for accents
        inversePrimary:
            Colors.white, // Inverse of the primary color for contrast
      ),
    );
  }

  static Color? surface(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color? primary(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Color? secondary(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static Color? inversePrimary(BuildContext context) {
    return Theme.of(context).colorScheme.inversePrimary;
  }

  /// Defines the dark theme of the app.
  ///
  /// This method returns a [ThemeData] object configured with a [ColorScheme.dark].
  /// The primary color remains the same as in the light theme, while the surface color
  /// set to black to suit dark mode. The secondary color is white, and the
  /// [inversePrimary] color is set to a light grey, providing a subtle contrast.
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        surface: Colors
            .black, // Background surface color for components in dark mode
        primary: const Color.fromARGB(
            255, 16, 83, 18), // Primary color remains consistent
        secondary: Colors.white, // Secondary color for accents in dark mode
        inversePrimary:
            Colors.grey[400], // Light grey color for inverted elements
      ),
    );
  }
}
