import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class DownloadingItem extends StatelessWidget {
  final bool isVisible;

  const DownloadingItem({
    this.isVisible = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Visibility(
        visible: isVisible,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.padding8.h),
            child: const AppLoader(),
          ),
        ),
      ),
    );
  }
}
