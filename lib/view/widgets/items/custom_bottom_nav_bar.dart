import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items/item_details_controller.dart';

import '../../../core/constants/color.dart';

class CustomBotomNavBar extends GetView<ItemDetailsControllerImp> {
  const CustomBotomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        child: MaterialButton(
          color: AppColor.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () async {
            if (controller.cartItemCount == controller.cartItemCountInit) {
              controller.goToCart();
            } else if(controller.cartItemCount > controller.cartItemCountInit) {
              await controller.addItemToCart();
              controller.goToCart();
            }else{
               await controller.removeItemFromCart();
              controller.goToCart();
            }
          },
          child: GetBuilder<ItemDetailsControllerImp>(builder: (controller) {
            return Text(
                controller.cartItemCount == controller.cartItemCountInit
                    ? '46'.tr
                    : controller.cartItemCount < controller.cartItemCountInit? '107'.tr:'108'.tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold));
          }),
        ));
  }
}
