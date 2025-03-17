import 'package:flutter/material.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.blue, // Main color for app
      secondary: Colors.orange, // Accent color for buttons, icons
    ),
    scaffoldBackgroundColor: Colors.white, // Background color for pages
    cardColor: Colors.white, // Background for cards and containers
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent, // Button background color
    ),
    disabledColor: Colors.grey, // Disabled state color
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black45),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),
      labelStyle: TextStyle(fontSize: 16, color: Colors.black45),
      hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
    ),
   
    // buttonColor: Colors.blue, // Add this for 'Add to Cart' button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Ensure the button text is always white
          ),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.black, // Main color for app
      secondary: Colors.orange, // Accent color for buttons, icons
    ),
    buttonTheme: ButtonThemeData(),
    cardColor: Colors.grey[900]!, // Background for cards and containers
    disabledColor: Colors.grey[600]!, // Disabled state color
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.orange, width: 2),
      ),
      labelStyle: TextStyle(fontSize: 16, color: Colors.white70),
      hintStyle: TextStyle(fontSize: 14, color: Colors.white54),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.orange),
      trackColor: MaterialStateProperty.all(Colors.orange.withOpacity(0.4)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.orange),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ), // Add this for 'Add to Cart' button
    primaryTextTheme: TextTheme(
      labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white, // Ensure the button text is always white
      ),
    ),
  );
}
