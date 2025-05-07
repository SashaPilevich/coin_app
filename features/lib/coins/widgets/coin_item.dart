import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final CoinModel coin;
  final Color backgroundColor;

  const CoinItem({
    required this.coin,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = AppFonts.semiBold17.copyWith(
      color: AppColors.of(context).textPrimary,
      letterSpacing: AppDimens.letterSpacing041,
      height: AppDimens.heightFactor14,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.padding14.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: AppDimens.size56.w,
            height: AppDimens.size56.w,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppDimens.borderRadius18.r),
            ),
          ),
          SizedBox(width: AppDimens.size16.w),
          Text(
            coin.symbol,
            style: textStyle,
          ),
          const Spacer(),
          Text(
            '\$${coin.priceUsd.formatPrice}',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
