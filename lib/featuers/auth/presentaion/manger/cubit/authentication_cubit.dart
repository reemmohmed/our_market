import 'dart:developer';

import 'package:bloc/bloc.dart';
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
}
