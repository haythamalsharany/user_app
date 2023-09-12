import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constants/routes.dart';
import 'package:my_ecommerce/core/functions/handingdatacontroller.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/models/commet_model.dart';

import '../../core/class/statusrequest.dart';
import '../../data/data_sources/remote/rating/rating_data.dart';
import '../../data/models/item_model.dart';
import '../cart_controller.dart';

abstract class ItemDetailsController extends GetxController {
  initial();
}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemModel itemModel;
  CartController cartController = Get.put(CartController());
  final RatingData _ratingData = RatingData(Get.find());
  final MyServices _myServices = Get.find();
  late TextEditingController addCommenController;
  int cartItemCount = 0;
  int cartItemCountInit = 0;
  String rating = '0';
  String ratingId = '0';
  String userId = '0';

  int userRateVal = 0;
  int activeColor = 0;
  List<CommentRateModel> comments = [];
  List<ColorModel> colors = [];
  StatusRequest statusRequest = StatusRequest.none;
  @override
  initial() async {
    userId = _myServices.sharedPreferences.getString('id')!;
    addCommenController = TextEditingController();
    addCommenController.text = '';
    itemModel = Get.arguments['item'];
    cartItemCount = await cartController.getCartItemCount(itemModel.itemsId!);
    cartItemCountInit = cartItemCount;

    update();
  }

  changeUserRateVal(int val) {
    userRateVal = val;
    update();
  }

  @override
  void onInit() {
    initial();
    getItemColors();
    getItemRating();
    super.onInit();
  }

  getItemColors() async {
    log('----------------------------------------getItemColors');
    statusRequest = StatusRequest.loading;
    colors.clear();
    var response =
        await _ratingData.getItemColors(itemModel.itemsId.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        log('response: $response');

        List data = response['data'];
        colors.addAll(data.map((e) => ColorModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getItemRating() async {
    statusRequest = StatusRequest.loading;
    comments.clear();
    var response = await _ratingData.getData(itemModel.itemsId.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        log('response: $response');
        rating = response['rating'];
        List data = response['data'];
        comments.addAll(data.map((e) => CommentRateModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  addItemRating() async {
    log('add rating function');
    statusRequest = StatusRequest.loading;
    Map data = {
      "userId": _myServices.sharedPreferences.getString('id')!,
      'itemId': itemModel.itemsId,
      'rating': (userRateVal + 1).toString(),
      'comment': addCommenController.text
    };
    var response = await _ratingData.addData(data);

    statusRequest = handlingData(response);
    log('response : $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        getItemRating();
        Get.rawSnackbar(
            title: 'alert', message: 'Rating was adding successfuly');
      } else {
        Get.rawSnackbar(
            title: 'faild', message: 'you can not rate product before buy it');
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  editItemRating() async {
    log('edit rating function');
    statusRequest = StatusRequest.loading;
    Map data = {
      'ratingId': ratingId,
      'rating': (userRateVal + 1).toString(),
      'comment': addCommenController.text
    };

    log('dataEdite:$data');
    var response = await _ratingData.editData(data);

    statusRequest = handlingData(response);
    log('response : $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        getItemRating();
        Get.rawSnackbar(
            title: 'alert', message: 'Rating was Editing successfuly');
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  deleteItemRating() async {
    log('delete rating function');
    statusRequest = StatusRequest.loading;
    Map data = {
      'ratingId': ratingId,
    };

    log('dataEdite:$data');
    var response = await _ratingData.deleteData(data);

    statusRequest = handlingData(response);
    log('response : $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        getItemRating();
        Get.rawSnackbar(
            title: 'alert', message: 'Rating was Edit deleted ing successfuly');
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  addItemToCart() {
    cartController.addCartItem(
        itemModel.itemsId!, (cartItemCount - cartItemCountInit).toString());

    cartItemCountInit = cartItemCount;
    update();
  }

  incrementQyn() {
    cartItemCount++;
    update();
  }

  decrementQyn() {
    if (cartItemCount > 0) {
      cartItemCount--;
    }
    update();
  }

  removeItemFromCart() {
    
        cartController.deleteCartItem(
            itemModel.itemsId!, (cartItemCountInit - cartItemCount).toString());
        cartItemCountInit = cartItemCount;
    update();
  }

  onEdit(String val, {String id = '0'}) {
    addCommenController.text = val;
    ratingId = id;
    update();
  }

  onSelectColor(
    int colorIndx,
  ) {
    activeColor = colorIndx;
    update();
  }

  goToCart() {
    Get.toNamed(AppRoute.cart);
  }
}
