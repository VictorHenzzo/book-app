sealed class Either<E extends Exception, R> {
  const Either();

  bool hasError() {
    return runtimeType is Failure;
  }
}

final class Success<E extends Exception, R> extends Either<E, R> {
  const Success(this.value);
  final R value;
}

final class Failure<E extends Exception, R> extends Either<E, R> {
  const Failure(this.exception);
  final E exception;
}
