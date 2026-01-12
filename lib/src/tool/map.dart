extension SortedMapExtension on Map {
  Map sortedByKeys() {
    final sortedKeys = keys.toList()..sort();
    return Map.fromEntries(sortedKeys.map((key) => MapEntry(key, this[key])));
  }
}
