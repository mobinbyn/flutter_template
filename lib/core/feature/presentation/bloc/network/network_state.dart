part of 'network_bloc.dart';

sealed class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

final class NetworkInitial extends NetworkState {}

final class NetworkSuccess extends NetworkState {}

final class NetworkFailure extends NetworkState {}
