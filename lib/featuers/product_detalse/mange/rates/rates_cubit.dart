import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market/core/AppServer/api_serves.dart';
import 'package:our_market/featuers/product_detalse/data/rates_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'rates_state.dart';

class RatesCubit extends Cubit<RatesState> {
  RatesCubit() : super(RatesInitial());
  final ApiServes apiServes = ApiServes();
  int averagerate = 0;
  int userRate = 5;
  List<RatesModel> rates = [];
  Future<void> getRates({required String productId}) async {
    emit(RatesLoading());
    try {
      Response response = await apiServes
          .getdata("rates_table?select=*&for_product=eq.$productId");
      for (var rate in response.data) {
        rates.add(RatesModel.fromJson(rate));
      }
      _getRates();
      _getRateUser();
      // log("userId is ${Supabase.instance.client.auth.currentUser!.id}");
      // log("user rate is ${rateUser[0].forUser}");
      // log("ratUserleaght  is ${rateUser.length}");
      // log("rateUser  is ${rateUser[0].rate}");

      // log(rates.length.toString());

      emit(RatesSuccess());
    } catch (e) {
      log(e.toString());
      emit(RatesFailure());
    }
  }

  void _getRateUser() {
    List<RatesModel> rateUser = rates
        .where((RatesModel rate) =>
            rate.forUser == Supabase.instance.client.auth.currentUser!.id)
        .toList();
    if (rateUser.isNotEmpty) {
      userRate = rateUser[0].rate!;
    } else {
      userRate = 0;
    }
  }

// this function is used to calculate the average rate
  void _getRates() {
    for (var rateUsers in rates) {
      // log(rateUsers.rate.toString());
      if (rateUsers.rate != null) {
        averagerate += rateUsers.rate!;
      }
    }
    averagerate = averagerate ~/ rates.length;
  }
}
