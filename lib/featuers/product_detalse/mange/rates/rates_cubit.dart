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
  List<RatesModel> rates = [];
  Future<void> getRates({required String productId}) async {
    emit(RatesLoading());
    try {
      Response response = await apiServes
          .getdata("rates_table?select=*&for_product=eq.$productId");
      for (var rate in response.data) {
        rates.add(RatesModel.fromJson(rate));
      }

      log(rates.toString());

      emit(RatesSuccess());
    } catch (e) {
      log(e.toString());
      emit(RatesFailure());
    }
  }
}
