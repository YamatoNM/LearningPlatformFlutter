enum SortOption {
  titleAsc,
  ratingDesc,
  priceAsc,
  durationDesc,
}

extension SortOptionExtension on SortOption {
  String get label {
    switch (this) {
      case SortOption.titleAsc:
        return 'Title (A-Z)';
      case SortOption.ratingDesc:
        return 'Highest Rated';
      case SortOption.priceAsc:
        return 'Price (Lowest First)';
      case SortOption.durationDesc:
        return 'Duration (Longest First)';
    }
  }
}
