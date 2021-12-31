part of 'internet_connection_cubit.dart';

abstract class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object?> get props => [];
}

class InternetConnectionInitial extends InternetConnectionState {}

class InternetConnectionConnected extends InternetConnectionState {
  final InternetConnectionStatus internetConnectionStatus;

  InternetConnectionConnected({required this.internetConnectionStatus});

  @override
  List<Object?> get props => [internetConnectionStatus];
}

class InternetConnectionDisconnected extends InternetConnectionState {
  final String message;

  InternetConnectionDisconnected({required this.message});

  @override
  List<Object?> get props => [message];
}