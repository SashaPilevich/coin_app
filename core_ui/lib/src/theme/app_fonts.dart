import 'package:flutter/material.dart';

import 'app_dimens.dart';

class AppFonts {
  static const String sfProTextFontFamily = 'SFProText';

  static TextStyle get sfProTextDisplay => const TextStyle(
        fontFamily: sfProTextFontFamily,
      );

  ///MEDIUM
  static TextStyle get medium16 => sfProTextDisplay.copyWith(
        fontSize: AppDimens.fontSize16,
        fontWeight: FontWeight.w500,
      );

  ///SEMIBOLD
  static TextStyle get semiBold17 => sfProTextDisplay.copyWith(
        fontSize: AppDimens.fontSize17,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get semiBold20 => sfProTextDisplay.copyWith(
    fontSize: AppDimens.fontSize20,
    fontWeight: FontWeight.w600,
  );
}
