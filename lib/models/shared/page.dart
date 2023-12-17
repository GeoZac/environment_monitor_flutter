/// Represents a paginated result containing a subset of data along with pagination information.
class Page<T> {
  /// Indicates whether this is the first page of the pagination.
  bool isFirst;

  /// Indicates whether this is the last page of the pagination.
  bool isLast;

  /// Indicates whether there is a next page available.
  bool hasNext;

  /// Indicates whether there is a previous page available.
  bool hasPrevious;

  /// The list of data items for the current page.
  List<T> data;

  /// The total number of elements across all pages.
  int totalElements;

  /// The current page number.
  int pageNumber;

  /// The total number of pages.
  int totalPages;

  /// Creates a new instance of the [Page] class.
  ///
  /// - [isFirst]: Indicates whether this is the first page.
  /// - [isLast]: Indicates whether this is the last page.
  /// - [hasNext]: Indicates whether there is a next page.
  /// - [hasPrevious]: Indicates whether there is a previous page.
  /// - [data]: The list of data items for the current page.
  /// - [totalElements]: The total number of elements across all pages.
  /// - [pageNumber]: The current page number.
  /// - [totalPages]: The total number of pages.
  Page({
    required this.isFirst,
    required this.isLast,
    required this.hasNext,
    required this.hasPrevious,
    required this.data,
    required this.totalElements,
    required this.pageNumber,
    required this.totalPages,
  });
}
