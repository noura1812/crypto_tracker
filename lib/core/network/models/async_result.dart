import 'package:crypto_tracker/core/network/error/failure.dart';

sealed class AsyncResult<T> {}

class Loading<T> extends AsyncResult<T> {}

class Data<T> extends AsyncResult<T> {
  final T data;
  Data(this.data);
}

class Error<T> extends AsyncResult<T> {
  final T? data;

  final Failure error;
  Error(this.error, {this.data});
}
