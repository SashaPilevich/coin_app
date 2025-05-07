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
  static const Color violet = Color(0xFF7E49FF);
  static const Color lightViolet = Color(0xFFF5F2FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF17171A);
  static const Color lightMist = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF4a4c54);

  //background
  Color get bgScreenPrimary;

  Color get bgAccent;

  //text
  Color get textPrimary;

  Color get textSecondary;

  //shimmer
  Color get shimmerBaseColor;

  Color get shimmerHighlightColor;

  Color get appLoaderColor;
}

class DarkColors implements AppColors {
  const DarkColors();

  @override
  Color get bgScreenPrimary => Colors.white;

  @override
  Color get bgAccent => AppColors.violet;

  @override
  Color get textPrimary => Colors.black;

  @override
  Color get textSecondary => AppColors.darkGray;

  @override
  Color get shimmerBaseColor => AppColors.lightMist;

  @override
  Color get shimmerHighlightColor => AppColors.lightViolet;

  @override
  Color get appLoaderColor => AppColors.lightViolet;
}

class LightColors extends DarkColors {
  const LightColors();
}
