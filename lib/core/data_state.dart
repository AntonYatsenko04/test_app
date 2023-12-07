// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? dioException;
  final Exception? exception;

  const DataState({
    this.data,
    this.dioException,
    this.exception,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataOffline<T> extends DataState<T> {
  const DataOffline(T data, DioException dioException)
      : super(data: data, dioException: dioException);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(Exception exception) : super(exception: exception);
}
