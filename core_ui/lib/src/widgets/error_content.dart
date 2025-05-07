import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ErrorContent extends StatelessWidget {
  final VoidCallback onTryAgain;
  final String? errorTitle;
  final String? errorMessage;

  const ErrorContent({
    required this.onTryAgain,
    this.errorTitle,
    this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.padding20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: AppDimens.size44.h,
              color: AppColors.violet,
            ),
            SizedBox(height: AppDimens.size16.h),
            Text(
              errorTitle ?? LocaleKeys.coins_errorTitle.tr(),
              style: AppFonts.semiBold20.copyWith(color: appColors.textPrimary),
            ),
            SizedBox(height: AppDimens.size12.h),
            Text(
              errorMessage ?? LocaleKeys.coins_errorMessage.tr(),
              textAlign: TextAlign.center,
              style: AppFonts.medium16.copyWith(color: appColors.textSecondary),
            ),
            SizedBox(height: AppDimens.size32.h),
            AppButton(
              buttonText: LocaleKeys.coins_tryAgain.tr(),
              onPressed: onTryAgain,
            ),
          ],
        ),
      ),
    );
  }
}
