import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  SupabaseClient clint = Supabase.instance.client;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await clint.auth.signInWithPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(LoginFailure(error: e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> regester(
      {required String name,
      required String email,
      required String password}) async {
    emit(SinghUpLoading());
    try {
      await clint.auth.signUp(
        password: password,
        email: email,
      );
      emit(SinghUpSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(SinghUpFailure(error: e.message));
    } catch (e) {
      log(e.toString());
      emit(SinghUpFailure(error: e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;
  Future<AuthResponse> googleSignIn() async {
    emit(GoogelSinghtInLoading());

    const webClientId =
        '1043198267988-mcf37mvc4dq8mjuk9l20aoet5duron6d.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogelSinghtInFailuer());
      return AuthResponse();
    }

    AuthResponse response = await clint.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    emit(GoogelSinghtInSucsess());
    return response;
  }
}
