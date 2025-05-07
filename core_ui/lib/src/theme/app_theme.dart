import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

const DarkColors _darkColors = DarkColors();
const LightColors _lightColors = LightColors();

final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: _darkColors.bgScreenPrimary,
  appBarTheme: _getAppBarTheme(_darkColors),
  textTheme: _getTextTheme(_darkColors),
  primaryColor: _darkColors.bgScreenPrimary,
  brightness: Brightness.dark,
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
  ),
  scaffoldBackgroundColor: _lightColors.bgScreenPrimary,
  appBarTheme: _getAppBarTheme(_lightColors),
  textTheme: _getTextTheme(_lightColors),
  primaryColor: _lightColors.bgScreenPrimary,
);

AppBarTheme _getAppBarTheme(AppColors colors) {
  return const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(),
  );
}

TextTheme _getTextTheme(AppColors colors) {
  return const TextTheme().apply(
    bodyColor: colors.textPrimary,
    displayColor: colors.textPrimary,
  );
}
