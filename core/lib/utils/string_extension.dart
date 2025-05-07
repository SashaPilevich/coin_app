import '../core.dart';

extension StringExtensions on String {
  String get formatPrice {
    return NumberFormat('#,##0.00', 'en_US').format(double.parse(this));
  }
}
