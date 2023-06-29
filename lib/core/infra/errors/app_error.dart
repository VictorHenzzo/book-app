class AppError {
  const AppError({
    required this.stackTrace,
    required this.exception,
  });

  final StackTrace stackTrace;
  final Exception exception;
}
