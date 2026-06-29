// features/vto/presentation/manager/vto_cubit/vto_state.dart
part of 'vto_cubit.dart';

@immutable
sealed class VtoState {}

class VtoInitial extends VtoState {}
class VtoLoading extends VtoState {}

class VtoSuccess extends VtoState {
  final VtoEntity result;
  VtoSuccess({required this.result});
}

class VtoFailure extends VtoState {
  final String errorMessage;
  VtoFailure({required this.errorMessage});
}