import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/checkout_controller.dart';

import '../../../core/constants/color.dart';

class DeliveryType extends GetView<CheckoutController> {
  final String image;
  final String type;
  final bool isActive;
  const DeliveryType({
    super.key,
    required this.type,
    required this.image,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.chooseDeliveryType(type);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: isActive ? AppColor.secondColor : null,
            border: Border.all(color: AppColor.secondColor)),
        child: Column(children: [
          Image.asset(image, height: 80),
          Text(
            type == '0' ? ' 73'.tr : '72'.tr,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.secondColor,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
