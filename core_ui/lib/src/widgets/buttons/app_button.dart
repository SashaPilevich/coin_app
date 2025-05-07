import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

enum AppButtonType {
  primaryViolet,
  transparent,
}

class AppButton extends StatefulWidget {
  final AppButtonType type;
  final VoidCallback? onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final double borderRadius;
  final double? width;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? sideColor;

  const AppButton({
    required this.buttonText,
    this.type = AppButtonType.primaryViolet,
    this.buttonTextStyle,
    this.onPressed,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius = AppDimens.borderRadius12,
    this.width,
    this.isLoading = false,
    this.backgroundColor,
    this.sideColor,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  final GlobalKey contentKey = GlobalKey();
  double contentHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          contentHeight = contentKey.currentContext?.size?.height ??
              widget.verticalPadding ??
              AppDimens.padding14.h * 2;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    Color loaderColor = AppColors.white;
    Color backgroundColor = widget.backgroundColor ?? appColors.bgAccent;
    Color borderColor = AppColors.transparent;

    switch (widget.type) {
      case AppButtonType.primaryViolet:
        backgroundColor = backgroundColor;
        break;

      case AppButtonType.transparent:
        backgroundColor = AppColors.transparent;
        borderColor = widget.sideColor ?? AppColors.transparent;
        break;
    }

    return GestureDetector(
      onTap: widget.isLoading ? null : widget.onPressed,
      child: Container(
        width: widget.width,
        padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? AppDimens.padding14.h,
          horizontal: widget.horizontalPadding ?? AppDimens.padding12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          border: Border.all(color: borderColor),
          color: widget.type == AppButtonType.transparent ? AppColors.transparent : backgroundColor,
        ),
        child: widget.isLoading
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.padding2.h),
                  child: SizedBox(
                    height: contentHeight,
                    width: contentHeight,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: loaderColor,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  widget.buttonText,
                  style:
                      widget.buttonTextStyle ?? AppFonts.medium16.copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
