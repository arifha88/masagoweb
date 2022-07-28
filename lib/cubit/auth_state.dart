part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}


class AuthLoaded extends AuthState {
  final Auth auth;

  AuthLoaded(this.auth);

  @override
  List<Object> get props => [auth];
}

class AuthLoadingFailed extends AuthState {
  final String? message;

  AuthLoadingFailed(this.message);

  @override
  List<Object> get props => [message ?? ""];
}