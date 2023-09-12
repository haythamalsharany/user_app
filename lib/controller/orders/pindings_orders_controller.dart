import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/statusrequest.dart';
import 'package:my_ecommerce/core/functions/handingdatacontroller.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/models/orders_model.dart';

import '../../data/data_sources/remote/orders/pindings_data.dart';

class OrdersController extends GetxController {
  deleteOrder(String orderId) {}
  String getOrderType(String val) {
    if (val == '0') {
      return '72'.tr;
    } else {
      return '73'.tr;
    }
  }

  String getOrderPaymentMethod(String val) {
    if (val == '0') {
      return '74'.tr;
    } else {
      return '75'.tr;
    }
  }

  String getOrderStatus(String val) {
    if (val == '0') {
      return '76'.tr;
    } else if (val == '1') {
      return '77'.tr;
    }else if (val == '2') {
      return '78'.tr;
    }else if (val == '3') {
      return '79'.tr;
    }else{
      return '80'.tr;
    }
  }
}

class PindingsOrdersController extends OrdersController {
  OrdersPindingsData ordersPindingsData = OrdersPindingsData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> pindingsOrders = [];
  StatusRequest statusRequest = StatusRequest.none;

  getPindingsOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPindingsData
        .getData(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);

    log(' pindingsOrders : $statusRequest');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List dataList = response['data'];
        pindingsOrders
            .addAll(dataList.map((e) => OrdersModel.fromJson(e)).toList());
        update();
        if (pindingsOrders.isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  @override
  deleteOrder(String orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPindingsData.delete(orderId);
    statusRequest = handlingData(response);

    log(' pindingsOrders : $statusRequest');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "94".tr,
            messageText:  Text('98'.tr));
        getPindingsOrders();
      }
      {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  refreshOrders() {
    getPindingsOrders();
  }

  @override
  void onInit() {
    getPindingsOrders();
    super.onInit();
  }
}
