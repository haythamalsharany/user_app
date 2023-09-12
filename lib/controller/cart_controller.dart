import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/statusrequest.dart';
import 'package:my_ecommerce/core/constants/routes.dart';
import 'package:my_ecommerce/core/functions/handingdatacontroller.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/data_sources/remote/cart/cart_data.dart';
import 'package:my_ecommerce/data/models/cart_model.dart';

import '../data/models/coupon_model.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  late TextEditingController couponControler;
  List<CartModel> data = [];
  late CouponModel couponModel;
  StatusRequest statusRequest = StatusRequest.none;

  int totalcountitems = 0;
  double priceorders = 0.0;
  int couponDiscount = 0;
  String couponName = '';
  String couponId = '';

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    getCartItems();
  }

  addCartItem(String itemId,String qyt) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCartItem(
        itemId, myServices.sharedPreferences.getString('id')!,qyt);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      refreshPage();
      Get.rawSnackbar(
          title: 'اشعار',
          messageText: const Text('تمت إضافة المنتج الى السلة'));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteCartItem(String itemId,String qyt) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCartItem(
        itemId, myServices.sharedPreferences.getString('id')!,qyt);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      refreshPage();
      Get.rawSnackbar(
          title: "94".tr, messageText:  Text('114'.tr));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getCartItemCount(String itemId) async {
    var response = await cartData.getCartItemsCount(
        itemId, myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      return int.parse(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  getTotalPrice() {
    return priceorders - priceorders * couponDiscount / 100;
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(couponControler.text);
    statusRequest = handlingData(response);

    log('coupon :$response ');
    if (statusRequest == StatusRequest.success) {
      log('couponstatusRequest $statusRequest');

      if (response['status'] == "success") {
        couponModel = CouponModel.fromJson(response['data']);
        couponDiscount = int.parse(couponModel.couponDiscount ?? '0');
        couponName = couponModel.couponName ?? '';
        couponId = couponModel.couponId ?? '';
      } else {
        couponDiscount = 0;
        couponName = '';
        couponId = '';
        Get.snackbar("94".tr, "115".tr);
      }
    } else {}

    update();
  }

  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .getCartItems(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['cartData']['status'] == "success") {
          List dataresponse = response['cartData']['data'];
          Map dataresponsecountprice = response['countAndPrice'];

          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToCheckout() {
    var arg = {
      'couponid': couponId,
      'priceorder': priceorders.toString(),
      'discountcoupon': couponDiscount.toString(),
    };
    Get.toNamed(AppRoute.checkout, arguments: arg);
  }

  @override
  void onInit() {
    couponControler = TextEditingController();
    getCartItems();
    super.onInit();
  }
}
