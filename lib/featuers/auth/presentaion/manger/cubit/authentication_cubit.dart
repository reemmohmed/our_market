import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:our_market/featuers/auth/presentaion/data/user_data_model.dart';
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
      await getUserData();
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
      await addUserIdToDatabase(name: name, email: email);
      await getUserData();
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
    await addUserIdToDatabase(
        name: googleUser!.displayName!, email: googleUser!.email);
    await getUserData();
    emit(GoogelSinghtInSucsess());
    return response;
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await clint.auth.signOut();
      emit(SignOutSucsess());
    } catch (e) {
      log(e.toString());
      emit(SignOutFailuer());
    }
  }

  Future<void> resetpassword({required String email}) async {
    emit(ResetpasswordLoging());
    try {
      await clint.auth.resetPasswordForEmail(email);
    } catch (e) {
      (e.toString());
      emit(ResetpasswordFailuer(
        error: e.toString(),
      ));
    }
  }

// inset => only add data
// upsert => add or update data
  Future<void> addUserIdToDatabase(
      {required String name, required String email}) async {
    emit(AddUserIdToDataBseLoading());
    try {
      await clint.from('users').upsert({
        "user_id": clint.auth.currentUser!.id,
        'name': name,
        'email': email
      });
      emit(AddUserIdToDataBseSucsess());
    } catch (e) {
      log(e.toString());
      emit(AddUserIdToDataBseFailuer());
    }
  }

  UserDataModel? userData;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final data = await clint
          .from('users')
          .select()
          .eq("user_id", clint.auth.currentUser!.id);
      userData = UserDataModel(
          userId: data[0]["user_id"],
          name: data[0]["name"],
          email: data[0]["email"]);
      log(data.toString());
      emit(GetUserDataSucsess());
    } catch (e) {
      log(e.toString());
    }
  }
}
