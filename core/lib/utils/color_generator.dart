import 'dart:math';
import 'dart:ui';

/// Generates a unique color for the given index.
class ColorGenerator {
  static Color generateColor(int index) {
    final Random random = Random(index);
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
