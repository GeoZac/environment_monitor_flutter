class Page<T> {
  bool isFirst;
  bool isLast;
  bool hasNext;
  bool hasPrevious;
  List<T> data;
  int totalElements;
  int pageNumber;
  int totalPages;

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
