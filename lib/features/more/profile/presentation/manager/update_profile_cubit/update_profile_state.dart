part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoading extends UpdateProfileState {}
class UpdateProfileSuccess extends UpdateProfileState {
  final String message;
  UpdateProfileSuccess({required this.message});
}
class UpdateProfileFailure extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileFailure({required this.errorMessage});
}