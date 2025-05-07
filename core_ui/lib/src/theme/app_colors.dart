import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.ofGlobalContext() {
    final BuildContext? context = appLocator<AppRouter>().navigatorKey.currentContext;
    if (context == null) {
      return const DarkColors();
    }
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  //MAIN COLOR SCHEME
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF17171A);

  //background
  Color get bgScreenPrimary;

  //text
  Color get textPrimary;
}

class DarkColors implements AppColors {
  const DarkColors();

  @override
  Color get bgScreenPrimary => Colors.white;

  @override
  Color get textPrimary => Colors.black;
}

class LightColors extends DarkColors {
  const LightColors();
}
