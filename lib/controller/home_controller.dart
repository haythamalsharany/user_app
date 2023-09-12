import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constants/routes.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/models/item_model.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/data_sources/remote/home_data.dart';

abstract class HomeController extends SearchMixController {
  initData();
  getData();
  goToItems(List categories, int selectedCatIndex);
  goToFavorite();
  goToItemDetails(ItemModel itemModel);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();

  List categories = [];
  List items = [];
  String title = '';
  String body = '';
  String deliveryTime = '';

  String? lang;

  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic('users');
    initData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        log('settings :${response['settings']['data']}');
        title = response['settings']['data'][0]['settings_title'];
        body = response['settings']['data'][0]['settings_body'];
        deliveryTime =
            response['settings']['data'][0]['settings_delivery_time'];
        myServices.sharedPreferences.setString('deliveryTime', deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  initData() {
    lang = myServices.sharedPreferences.getString('lang');
  }

  @override
  goToItems(List categories, int selectedCatIndex) {
    Get.toNamed(AppRoute.items,
        arguments: {'categories': categories, 'selectedCat': selectedCatIndex});
  }

  @override
  goToFavorite() {
    Get.toNamed(
      AppRoute.myfavroite,
    );
  }

  @override
  goToItemDetails(ItemModel itemModel) {
    Get.toNamed(AppRoute.itemdetails, arguments: {'item': itemModel});
  }
}

class SearchMixController extends GetxController {
  List<ItemModel> searchData = [];
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController search;
  bool isSearched = false;
  HomeData homedata = HomeData(Get.find());

  checkSearch(val) {
    if (val == '') {
      isSearched = false;
      FocusScope.of(Get.context!).unfocus();
      statusRequest = StatusRequest.none;
    }
    update();
  }

  getSearchData() async {
    statusRequest = StatusRequest.loading;

    var response = await homedata.geSearchData(search.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];
        searchData.clear();
        searchData.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  onSearchPresed() {
    FocusScope.of(Get.context!).unfocus();
    isSearched = true;
    getSearchData();
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
