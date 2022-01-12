extension AdvanceMapExtension<K, V> on Map<K, V> {

  /// Returns a new map containing all key-value pairs matching the given [predicate].
  ///
  /// The returned map preserves the entry iteration order of the original map.
  Map<K, V> where(final bool Function(MapEntry<K, V> entry) predicate) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (predicate(entry)) {
        result[entry.key] = entry.value;
      }
    }

    return result;
  }

  /// Returns a map containing all key-value pairs with keys matching the given [predicate].
  ///
  /// The returned map preserves the entry iteration order of the original map.
  Map<K, V> whereKeys(final bool Function(K) predicate) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (predicate(entry.key)) {
        result[entry.key] = entry.value;
      }
    }

    return result;
  }

}