import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  // Define custom colors for light and dark themes
  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: 'Poppins',
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        // containerTheme: ContainerThemeData(color: Colors.blue[100]!),
        datePickerTheme: DatePickerThemeData(
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Set border radius here
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        // containerTheme: ContainerThemeData(color: Colors.teal[700]!),
      );
}

// Define a custom container theme
class ContainerThemeData {
  final Color color;

  const ContainerThemeData({required this.color});
}
