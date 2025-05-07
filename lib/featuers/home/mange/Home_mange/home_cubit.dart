import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market/core/AppServer/api_serves.dart';
import 'package:our_market/featuers/home/data/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiServes _apiServes = ApiServes();
  List<ProductModel> products = [];
  List<ProductModel> saechResult = [];
  Future<void> getProduct({String? query}) async {
    emit(GetDataLoading());
    try {
      Response respose = await _apiServes.getdata(
          "products_table?select=*,favourtes_product(*),pruches_table(*)");
      for (var product in respose.data) {
        products.add(ProductModel.fromJson(product));
      }

      searchproduct(query);
      // log(respose.data.toString());
      if (!isClosed) {
        // التأكد من أن الـ Cubit ل
        //م يغلق بعد
        emit(GetDataSuccess());
      }
    } catch (e) {
      log(e.toString());
      if (!isClosed) {
        // التأكد من أن الـ Cubit لم يغلق بعد
        emit(GetDataError());
      }
    }
  }

  // saerch for product in the list// search  is any word in the product name
  void searchproduct(String? query) {
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          saechResult.add(product);
        }
      }
    }
  }
}
