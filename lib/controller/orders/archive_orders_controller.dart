import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/orders/pindings_orders_controller.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/data_sources/remote/orders/archive_data.dart';
import '../../data/models/orders_model.dart';

class ArchiveOrdersController extends OrdersController {
  OrdersArchuiveData ordersArchuiveData = OrdersArchuiveData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> archiveOrders = [];
  StatusRequest statusRequest = StatusRequest.none;

  getArchiveOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchuiveData
        .getData(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);

    log(' ordersArchuiveData : $statusRequest');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List dataList = response['data'];
        archiveOrders
            .addAll(dataList.map((e) => OrdersModel.fromJson(e)).toList());
            if (archiveOrders.isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
        }
      }
      {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  addRating(
      {required String orderId,
      required double rating,
      String? comment}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersArchuiveData.addRating(orderId, rating.toString(), comment);
    statusRequest = handlingData(response);

    log(' ordersArchuiveData : $statusRequest');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "Alert",
            messageText: const Text('Rating added successfuly'));
      }
      {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    getArchiveOrders();
    super.onInit();
  }
}
