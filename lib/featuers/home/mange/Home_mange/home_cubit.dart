import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market/core/AppServer/api_serves.dart';
import 'package:our_market/featuers/home/data/favourtes_product.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/home/data/pruches_table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiServes _apiServes = ApiServes();
  List<ProductModel> products = [];
  List<ProductModel> saechResult = [];
  List<ProductModel> catogeres = [];
  String? userId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> getProduct({String? query, String? catogery}) async {
    emit(GetDataLoading());
    try {
      Response respose = await _apiServes.getdata(
          "products_table?select=*,favourtes_product(*),pruches_table(*)");
      for (var product in respose.data) {
        products.add(ProductModel.fromJson(product));
      }
      getFavourteProduct();
      searchproduct(query);
      getCatogery(catogery);
      getUserOrderProduct();
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
    saechResult.clear(); // مسح النتائج السابقة
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          saechResult.add(product);
        }
      }
      log("Search Results: ${saechResult.map((product) => product.productName).toList()}");
    }
  }

  void getCatogery(String? catogery) {
    for (var product in products) {
      // print("product category: '${product.catogery}'");
    }
    if (catogery != null) {
      for (var product in products) {
        if (product.catogery!.trim().toLowerCase() == catogery.toLowerCase()) {
          catogeres.add(product);
        }
      }
    }
  }

//   void addToFavourites_product
  Map<String, bool> favoriteProducts = {};
  Future<void> addToFavourtes(String productId) async {
    emit(AddToFavourtesLoading());

    try {
      String path = "favourtes_product";

      Response dataFavourites = await _apiServes.postdata(path, {
        "is_favourite": true,
        "for_userid": userId,
        "for_productid": productId,
      });
      log("dataFavourites: ${dataFavourites.data}");
      favoriteProducts.addAll({
        productId: true,
      });
      emit(AddToFavourtesSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToFavourtesError());
    }
  }

  bool checkIsFavorite(String productId) {
    return favoriteProducts.containsKey(productId);
  }

  // check if the product is favourite or not
  // function removeFavorite
  Future<void> removeFromFavourites(String productId) async {
    emit(RemoveFromFavourtesLoading());
    try {
      String path =
          "favourtes_product?for_productid=eq.$productId&for_userid=eq.$userId";
      Response dataFavourites = await _apiServes.deletedata(path);

      log("dataFavourites: ${dataFavourites.data}");
      favoriteProducts.removeWhere((key, value) => key == productId);
// remove the product from the list
      favouritProductList
          .removeWhere((product) => product.productId == productId);

      emit(RemoveFromFavourtesSuccess());
    } catch (e) {
      log(e.toString());
      emit(RemoveFromFavourtesError());
    }
  }

// check if the product is favourite or not
  List<ProductModel> favouritProductList = [];
  void getFavourteProduct() {
    for (ProductModel product in products) {
      if (product.favourtesProduct != null &&
          product.favourtesProduct!.isNotEmpty) {
        for (FavourtesProduct favouritproduct in product.favourtesProduct!) {
          if (favouritproduct.forUserid == userId) {
            favouritProductList.add(product);
            favoriteProducts.addAll({product.productId!: true});
          }
        }
      }
    }
    log(favouritProductList.toString());
  }

  // clear all the favourite products
  Future<void> clearAllFavourites() async {
    emit(RemoveFromFavourtesLoading());

    try {
      final List<String> productIdsToRemove =
          favouritProductList.map((product) => product.productId!).toList();

      for (String productId in productIdsToRemove) {
        String path =
            "favourtes_product?for_productid=eq.$productId&for_userid=eq.$userId";
        await _apiServes.deletedata(path);
        favoriteProducts.remove(productId);
      }

      favouritProductList.clear();
      emit(RemoveFromFavourtesSuccess());
    } catch (e) {
      log(e.toString());
      emit(RemoveFromFavourtesError());
    }
  }

  Future<void> buyproduct({required String productId}) async {
    emit(BuyProductLoding());
    try {
      String path = "pruches_table";
      Response buy = await _apiServes.postdata(path,
          {"is_bought": true, "for_user": userId, "for_product": productId});

      emit(BuyProductSuccess());
    } catch (e) {
      log(e.toString());
      emit(BuyProductError());
    }
  }

// get userSorder
  List<ProductModel> usersOrders = [];
  void getUserOrderProduct() {
    for (ProductModel product in products) {
      if (product.pruchesTable != null && product.pruchesTable!.isNotEmpty) {
        for (PruchesTable usersOrder in product.pruchesTable!) {
          if (usersOrder.forUser == userId) {
            usersOrders.add(product);
          }
        }
      }
    }
    log(favouritProductList.toString());
  }

  Future<void> removeOrderFromServer(String productId) async {
    emit(RemoveOrderLoading()); // أرسل حالة بداية الحذف

    try {
      final path =
          "pruches_table?for_product=eq.$productId&for_user=eq.$userId";
      await _apiServes.deletedata(path);

      // حذف من القائمة المحلية
      usersOrders.removeWhere((product) => product.productId == productId);

      emit(RemoveOrderSuccess()); // حالة النجاح
      emit(
          GetDataSuccess()); // لتحديث الواجهة إن كنت تعتمد على هذه الحالة في الواجهة
    } catch (e) {
      log("Error while removing order: $e");
      emit(RemoveOrderError()); // أرسل حالة الخطأ
    }
  }
}
