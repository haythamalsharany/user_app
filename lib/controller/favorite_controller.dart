import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/data_sources/remote/favorite/favorite_data.dart';
import '../data/models/my_favorite.dart';
import 'home_controller.dart';

abstract class FavoriteController extends SearchMixController {
  setFavorite(id, val);
  addFavorite(itemId);
  removeFavorite(itemId);
  getFavorite();
  initial();
}

class FavoriteControllerImp extends FavoriteController {
  Map<String, String> isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  List<MyFavoriteModel> data = [];

  @override
  void onInit() {
    initial();
    super.onInit();
  }

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
    if (val == '1') {
      addFavorite(id);
    } else {
      removeFavorite(id);
    }
    update();
  }

  @override
  addFavorite(itemId) async {
    var response = await favoriteData.addFavorite(
        itemId, myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.rawSnackbar(
          title: '94'.tr, messageText:  Text('116'.tr));
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  removeFavorite(itemId) {
    var response = favoriteData.removeFavorite(
        itemId, myServices.sharedPreferences.getString('id')!);
    data.removeWhere((element) => element.itemId == itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.rawSnackbar(
          title: '94'.tr, messageText:  Text('117'.tr));
      if (data.isEmpty) {
        statusRequest = handlingData(StatusRequest.failure);
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  getFavorite() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getFavorite(myServices.sharedPreferences.getString('id')!);

    statusRequest = handlingData(response);
    log("favresponse:$response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List res = response['data'];

        for (var i in res) {
          data.add(MyFavoriteModel.fromJson(i));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initial() {
    getFavorite();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavoriteControllerImp &&
        listEquals(other.data, data) &&
        other.statusRequest == statusRequest;
  }

  @override
  int get hashCode => data.hashCode ^ statusRequest.hashCode;
}
