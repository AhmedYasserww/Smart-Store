part of 'register_client_cubit.dart';

@immutable
sealed class RegisterClientState {}

final class RegisterClientInitial extends RegisterClientState {}
final class RegisterClientLoading extends RegisterClientState {}
final class RegisterClientSuccess extends RegisterClientState {
  final RegisterModel registerModel;
  RegisterClientSuccess({required this.registerModel});
}
final class RegisterClientFailure extends RegisterClientState {
  final String errorMessage;
  RegisterClientFailure({required this.errorMessage});
}
