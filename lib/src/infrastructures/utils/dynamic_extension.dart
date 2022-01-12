extension NullableDynamicExtensions<T> on T? {
  /// Checks if data is null
  bool get isNull => this == null;

  /// Checks if data is not null
  bool get isNotNull => this != null;
}