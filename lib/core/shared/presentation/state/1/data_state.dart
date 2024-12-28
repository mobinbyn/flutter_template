import 'package:flutter_template/core/shared/data/data_source/error/failure.dart';

enum DataStateType {
  fetched,
  loading,
  failed;

  bool get isFetched => this == fetched;
  bool get isLoading => this == loading;
  bool get isFailed => this == failed;
}

sealed class DataState<T> {
  final T? valueOrNull;
  final Object? error;
  final DataStateType state;

  DataState({
    required this.state,
    this.valueOrNull,
    this.error,
  });

  T get value => valueOrNull!;

  R onState<R>({
    required R Function(T data) onFetched,
    required R Function() onLoading,
    required R Function(Object error) onFailed,
  }) {
    if (state.isFailed) {
      return onFailed(error!);
    } else if (state.isLoading) {
      return onLoading();
    } else {
      return onFetched(valueOrNull as T);
    }
  }
}

class Fetched<T> extends DataState<T> {
  final T data;

  Fetched(this.data) : super(state: DataStateType.fetched, valueOrNull: data);
}

class Loading<T> extends DataState<T> {
  Loading() : super(state: DataStateType.loading);
}

class Failed<T> extends DataState<T> {
  final Failure failure;

  Failed(this.failure) : super(state: DataStateType.failed, error: failure);
}
