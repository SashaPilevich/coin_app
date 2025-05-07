import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: AppDimens.size3.r,
        color: AppColors.of(context).appLoaderColor,
      ),
    );
  }
}
