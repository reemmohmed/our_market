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
  var UserId = Supabase.instance.client.auth.currentUser!.id;
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
      // test getratUSER
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
    List<RatesModel> rateUser = rates.where((RatesModel rate) {
      return rate.forUser == UserId;
    }).toList();
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
    if (rates.isNotEmpty) {
      averagerate = averagerate ~/ rates.length;
    }
  }

// this function is used to check if the user has already rated the product
  // if the user has already rated the product, return true
  // else return false
  bool _isUserRateExiets({required String productId}) {
    for (var rate in rates) {
      if ((rate.forUser == UserId) && (rate.forProduct == productId)) {
        return true;
      }
    }
    return false;
  }

// this function is used to add or update the rate for the user
  Future<void> addrateorputchrate(
      {required String productId, required Map<String, dynamic> data}) async {
    String path =
        "rates_table?select=*&for_product=eq.$productId&for_user=eq.$UserId";
    emit(AddOrPutchRateRateForUserLoding());
    try {
      // if the user has already rated the product, update the rate
      if (_isUserRateExiets(productId: productId)) {
        // patch rate
        await apiServes.patchdata(path, data);
      } else {
        // post for the rate
        await apiServes.postdata(path, data);
      }
      log("data addrateorputchrate  is $data");
      // await Supabase.instance.client.from("rates_table").upsert(data);
      // // أو أي لوجيك تضيف أو تحدث فيه التقييم
      // await getRates(productId: productId); // تحديث القائمة

      await getRates(productId: productId);
      emit(AddOrPutchRateRateForUserSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddOrPutchRateRateForUserFailure());
    }
  }

  Future<void> addComments({required Map<String, dynamic> data}) async {
    emit(AddCoomentLoding());
    try {
      // await apiServes.postdata(path, data);
      // await getRates(productId: productId);
      String path = "comments_table";
      apiServes.postdata(path, data);
      log("add Cooments = >  ${data.toString()}");

      emit(AddCoomentSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddCoomentFailure());
    }
  }
}
