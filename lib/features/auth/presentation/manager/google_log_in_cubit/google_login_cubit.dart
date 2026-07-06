import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/auth_repo.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  final AuthRepo authRepo;

  final _googleSignIn = GoogleSignIn(
    serverClientId: '621772234207-u88pbs1171endngc7o7iga0up8ss5bl7.apps.googleusercontent.com',
  );

  GoogleLoginCubit(this.authRepo) : super(GoogleLoginInitial());

  Future<void> loginWithGoogle() async {
    emit(GoogleLoginLoading());

    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        emit(GoogleLoginInitial());
        return;
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      log("🔑 ID Token: $idToken");

      if (idToken == null) {
        emit(GoogleLoginFailure(errorMessage: "Failed to get ID token"));
        return;
      }

      final result = await authRepo.loginWithGoogle(idToken: idToken);
      result.fold(
            (failure) => emit(GoogleLoginFailure(errorMessage: failure.errorMessage)),
            (entity) => emit(GoogleLoginSuccess(message: "Logged in with Google successfully")),

      );
    } catch (e) {
      log('❌ Google Sign In Error: $e');
      emit(GoogleLoginFailure(errorMessage: e.toString()));
    }
  }
}