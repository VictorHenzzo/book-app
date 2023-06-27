class AppError implements Exception {
  const AppError({
    required this.stackTrace,
    required this.exception,
  });

  final StackTrace stackTrace;
  final Exception exception;
}
