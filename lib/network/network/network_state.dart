part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}

final class NetworkConnectedState extends NetworkState {}
final class NetworkDisconnectedState extends NetworkState {}