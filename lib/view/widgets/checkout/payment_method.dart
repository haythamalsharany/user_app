import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/checkout_controller.dart';
import 'package:my_ecommerce/core/constants/color.dart';

class PaymentMethod extends GetView<CheckoutController> {
  final String methodName;
  final bool isActive;
  const PaymentMethod({
    super.key,
    required this.methodName,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.choosePaymentMethod(methodName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: isActive ? AppColor.secondColor : AppColor.thirdColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          methodName,
          style: TextStyle(
            height: 1,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : AppColor.secondColor,
          ),
        ),
      ),
    );
  }
}
