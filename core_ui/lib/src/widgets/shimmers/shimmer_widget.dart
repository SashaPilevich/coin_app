import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core_ui.dart';

class ShimmerWidget extends StatelessWidget {
  final double borderRadius;
  final double width;
  final double height;
  final Color? color;
  final Widget? child;

  const ShimmerWidget({
    this.borderRadius = AppDimens.borderRadius18,
    this.width = double.infinity,
    this.height = AppDimens.size56,
    this.color,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return Shimmer.fromColors(
      baseColor: color ?? appColors.shimmerBaseColor,
      highlightColor: appColors.shimmerHighlightColor,
      child: child ??
          Container(
            height: height,
            width: width,
            margin: EdgeInsets.symmetric(vertical: AppDimens.margin7.h),
            decoration: BoxDecoration(
              color: appColors.shimmerBaseColor,
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius).r,
              ),
            ),
          ),
    );
  }
}
