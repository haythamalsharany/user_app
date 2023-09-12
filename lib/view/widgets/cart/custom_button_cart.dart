import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/cart_controller.dart';

import '../../../core/constants/color.dart';

class CustomButtonCart extends GetView<CartController> {
  const CustomButtonCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        width: Get.width,
        child: MaterialButton(
          color: AppColor.primaryColor,
      
          onPressed: () {
            controller.goToCheckout();
          },
          child: Text('58'.tr,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ));
  }
}
