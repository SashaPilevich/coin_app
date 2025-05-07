import 'dart:ui';

/// Generates a unique color for the given index using a pseudo-random algorithm.
/// Returns the same color for the same index via caching.
class ColorGenerator {
  static Color generateColor(int index) {
    if (_colorCache.containsKey(index)) {
      return _colorCache[index]!;
    }

    final int seed = index;

    final int rResult = _lcg(seed);
    final int gResult = _lcg(rResult ^ seed);
    final int bResult = _lcg(gResult ^ seed);

    final int r = rResult % _maxChannelValue;
    final int g = gResult % _maxChannelValue;
    final int b = bResult % _maxChannelValue;

    final Color color = Color.fromRGBO(r, g, b, 1.0);

    _colorCache[index] = color;
    return color;
  }

  static const int _maxChannelValue = 256;
  static const int _multiplier = 1664525;
  static const int _increment = 1013904223;
  static final Map<int, Color> _colorCache = <int, Color>{};

  /// Applies the Linear Congruential Generator (LCG) to produce a pseudo-random value.
  /// Uses standard constants for optimal randomness.
  static int _lcg(int seed) {
    // LCG: next = (a * seed + c) % m
    final int next = (_multiplier * seed + _increment) % _maxChannelValue;
    return next;
  }
}
