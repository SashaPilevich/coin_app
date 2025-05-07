import 'package:flutter/material.dart';

import 'app_dimens.dart';

class AppFonts {
  static const String sfProTextFontFamily = 'SFProText';

  static TextStyle get sfProTextDisplay => const TextStyle(
        fontFamily: sfProTextFontFamily,
      );

  ///SEMIBOLD
  static TextStyle get semiBold17 => sfProTextDisplay.copyWith(
        fontSize: AppDimens.fontSize17,
        fontWeight: FontWeight.w600,
      );
}
