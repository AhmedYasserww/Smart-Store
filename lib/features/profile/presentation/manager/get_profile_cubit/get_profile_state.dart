
part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

class GetProfileInitial extends GetProfileState {}
class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final ClientProfileEntity profile;
  GetProfileSuccess({required this.profile});
}

class GetProfileFailure extends GetProfileState {
  final String errorMessage;
  GetProfileFailure({required this.errorMessage});
}