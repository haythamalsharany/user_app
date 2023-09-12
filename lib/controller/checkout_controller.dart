import 'package:get/get.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/data_sources/remote/address/address_data.dart';
import 'package:my_ecommerce/data/models/address_model.dart';

import '../core/class/statusrequest.dart';
import '../core/constants/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/data_sources/chaeckout_data.dart';

class CheckoutController extends GetxController {
  final AddressData _addressData = AddressData(Get.find());
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  late String couponid;
  late String coupondiscount;
  late String priceorders;

  List<AddressModel> addresses = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await _addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        addresses.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (addresses.isEmpty) {
          statusRequest = StatusRequest.failure;
        } else {
          chooseShippingAddress(addresses.first.addressId!);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }
    if (addressid == '0') {
      return Get.snackbar("Error", "Please select an address ");
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "userId": myServices.sharedPreferences.getString("id"),
      "addressId": addressid,
      "ordersType": deliveryType,
      "deliveryPrice": "10.0",
      "orderPrice": priceorders,
      "couponId": couponid,
      "couponDiscount": coupondiscount,
      "paymentMethod": paymentMethod
    };

    var response = await checkoutData.checkout(data);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homeScreen);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();

    super.onInit();
  }
}
