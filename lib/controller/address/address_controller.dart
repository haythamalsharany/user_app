import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constants/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/data_sources/remote/address/address_data.dart';
import '../../data/models/address_model.dart';

class AddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  double? lat = 23;
  double? long = 89;
  Position? postion;
  List<AddressModel> data = [];
  late AddressModel addressModel;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;




  intialData() {
    statusRequest = StatusRequest.none;
    getData();
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    statusRequest = StatusRequest.none;
    update();
  }

  setLatLang(double plat, double plang) {
    lat = plat;
    long = plang;
    statusRequest = StatusRequest.none;
    update();
    Get.toNamed(AppRoute.addressAddDetails);
  }

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    if (data.isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToEdite(AddressModel pAddressModel) {
    addressModel = pAddressModel;
    name = TextEditingController(text: addressModel.addressName);
    city = TextEditingController(text: addressModel.addressCity);
    street = TextEditingController(text: addressModel.addressStreet);
    Get.toNamed(AppRoute.addressEdit);
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goTOAddressDetailAdd() {
    statusRequest = StatusRequest.none;
    update();
    Get.toNamed(AppRoute.addressAddDetails);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat.toString(),
        long.toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getData();
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  editAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.editData(addressModel.addressId!,
        name!.text, city!.text, street!.text, lat.toString(), long.toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
