import 'dart:ui';

/// Generates a unique color for the given index using a pseudo-random algorithm.
/// Returns the same color for the same index via caching.
class ColorGenerator {
  static Color generateColor(int index) {
    if (_colorCache.containsKey(index)) {
      return _colorCache[index]!;
    }

    final int seed = _generateSeed(index);
    ;

    final int r = _lcg(seed) % _maxChannelValue;
    final int g = _lcg(r ^ seed) % _maxChannelValue;
    final int b = _lcg(g ^ seed) % _maxChannelValue;

    final Color color = Color.fromRGBO(r, g, b, 1.0);

    _colorCache[index] = color;

    if (_colorCache.length > _maxCacheSize) {
      _colorCache.remove(_colorCache.keys.first);
    }

    return color;
  }

  static const int _maxChannelValue = 256;
  static const int _multiplier = 1664525;
  static const int _increment = 1013904223;
  static final Map<int, Color> _colorCache = <int, Color>{};
  static const int _maxCacheSize = 500;
  static final int _baseSeed = DateTime.now().millisecondsSinceEpoch;
  static const int _modulus = 1 << 32;

  /// Applies the Linear Congruential Generator (LCG) to produce a pseudo-random value.
  /// Uses standard constants for optimal randomness.
  static int _lcg(int seed) {
    // LCG: next = (a * seed + c) % m
    return ((_multiplier * seed + _increment) % _modulus).abs();
  }

  static int _generateSeed(int index) {
    return index.hashCode ^ _baseSeed;
  }
}
