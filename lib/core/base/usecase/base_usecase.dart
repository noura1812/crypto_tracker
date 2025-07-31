abstract class BaseUseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class BaseUseCaseNoParams<T> {
  Future<T> call();
}

abstract class BaseStreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

abstract class BaseStreamUseCaseNoParams<T> {
  Stream<T> call();
}
