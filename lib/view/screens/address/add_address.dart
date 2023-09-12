import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/address/address_controller.dart';
import 'package:my_ecommerce/core/constants/color.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController controller = Get.put(AddressController());
    return Scaffold(
      body: OpenStreetMapSearchAndPick(
          center: const LatLong(23, 89),
          buttonColor: AppColor.primaryColor,
          buttonText: 'Set Current Location',
          
          onPicked: (pickedData) {
            controller.setLatLang(
                pickedData.latLong.latitude, pickedData.latLong.longitude);
          }),
    );
  }
}
