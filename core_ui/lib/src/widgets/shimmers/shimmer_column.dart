import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';
import 'shimmer_widget.dart';

class ShimmerColumn extends StatelessWidget {
  final int count;
  final double height;
  final double borderRadius;
  final double spacing;
  final EdgeInsets? padding;

  const ShimmerColumn({
    this.count = 2,
    this.height = AppDimens.size56,
    this.borderRadius = AppDimens.borderRadius18,
    this.spacing = AppDimens.padding14,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: AppDimens.padding14.h),
      child: Column(
        spacing: spacing.h,
        children: List<ShimmerWidget>.generate(
          count,
          (int index) => ShimmerWidget(
            height: height.h,
            borderRadius: borderRadius.r,
          ),
        ),
      ),
    );
  }
}
