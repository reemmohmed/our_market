import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market/core/AppServer/api_serves.dart';
import 'package:our_market/featuers/product_detalse/data/rates_model.dart';

part 'rates_state.dart';

class RatesCubit extends Cubit<RatesState> {
  RatesCubit() : super(RatesInitial());
  final ApiServes apiServes = ApiServes();
  int averagerate = 0;
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

      log(rates.length.toString());

      emit(RatesSuccess());
    } catch (e) {
      log(e.toString());
      emit(RatesFailure());
    }
  }

// this function is used to calculate the average rate
  void _getRates() {
    for (var rateUser in rates) {
      log(rateUser.rate.toString());
      if (rateUser.rate != null) {
        averagerate += rateUser.rate!;
      }
    }
    averagerate = averagerate ~/ rates.length;
  }
}
