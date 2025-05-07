import 'package:flutter/material.dart';

class LocalizationWidget extends InheritedWidget {
  final Function(Locale) _localeChangeCallback;

  const LocalizationWidget(
    this._localeChangeCallback, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static LocalizationWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocalizationWidget>();
  }

  void changeLocale(Locale locale) {
    _localeChangeCallback.call(locale);
  }

  @override
  bool updateShouldNotify(LocalizationWidget oldWidget) {
    return true;
  }
}
